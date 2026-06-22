return {
  -- Binary installer for LSP servers, formatters, linters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      -- Auto-install tools that aren't managed by mason-lspconfig
      local ensure = {
        "prettier", "stylua", "google-java-format",
        "eslint_d", "ruff",
      }
      local mr = require("mason-registry")
      mr.refresh(function()
        for _, name in ipairs(ensure) do
          local ok, pkg = pcall(mr.get_package, name)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end)
    end,
  },

  -- Bridges Mason ↔ nvim-lspconfig; auto-enables installed servers
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "basedpyright",
        "vtsls",
        "rust_analyzer",
        "jdtls",
      },
      -- Calls vim.lsp.enable() for every installed+registered server.
      -- jdtls is excluded because nvim-jdtls handles its own lifecycle.
      automatic_enable = {
        exclude = { "jdtls" },
      },
    },
  },

  -- Provides default server configs consumed by vim.lsp.config()
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",          -- must be loaded first to supply capabilities
    },
    config = function()
      -- Merge blink.cmp capabilities into every LSP client
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- Rounded borders on hover / signature help
      vim.lsp.handlers["textDocument/hover"] =
        vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      -- Diagnostic presentation
      vim.diagnostic.config({
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
          },
        },
        virtual_text = {
          source = "if_many",
          prefix = "●",
        },
        float = { border = "rounded", source = true },
        underline = true,
        update_in_insert = false,
      })

      -- Buffer-local LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
        callback = function(event)
          local buf = event.buf
          local function map(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = buf, desc = "LSP: " .. desc })
          end

          map("gd",         vim.lsp.buf.definition,                             "Go to definition")
          map("gD",         vim.lsp.buf.declaration,                            "Go to declaration")
          map("gr",         "<cmd>FzfLua lsp_references<cr>",                   "References")
          map("gi",         vim.lsp.buf.implementation,                         "Go to implementation")
          map("gy",         vim.lsp.buf.type_definition,                        "Go to type definition")
          map("K",          vim.lsp.buf.hover,                                  "Hover docs")
          map("<C-k>",      vim.lsp.buf.signature_help,                         "Signature help")
          map("<leader>lr", vim.lsp.buf.rename,                                 "Rename")
          map("<leader>la", vim.lsp.buf.code_action,                            "Code action")
          map("<leader>ls", "<cmd>FzfLua lsp_document_symbols<cr>",             "Document symbols")
          map("<leader>lW", "<cmd>FzfLua lsp_workspace_symbols<cr>",            "Workspace symbols")
          map("<leader>lf", function()
            require("conform").format({ bufnr = buf, lsp_fallback = true })
          end,                                                                   "Format")
          map("<leader>li", function()
            vim.lsp.inlay_hint.enable(
              not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }),
              { bufnr = buf }
            )
          end,                                                                   "Toggle inlay hints")

          -- Enable inlay hints by default if the server supports them
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = buf })
          end
        end,
      })
    end,
  },

  -- Java: nvim-jdtls manages its own start/attach cycle per buffer
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local jdtls = require("jdtls")
      local mason_registry = require("mason-registry")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          -- Guard: jdtls must be installed via Mason
          if not mason_registry.is_installed("jdtls") then
            vim.notify("jdtls not installed. Run :MasonInstall jdtls", vim.log.levels.WARN)
            return
          end

          local jdtls_path  = mason_registry.get_package("jdtls"):get_install_path()
          local launcher     = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
          local os_cfg       = vim.fn.has("mac") == 1 and "mac" or "linux"
          local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
          local workspace    = vim.fn.stdpath("data") .. "/jdtls/workspaces/" .. project_name

          jdtls.start_or_attach({
            cmd = {
              "java",
              "-Declipse.application=org.eclipse.jdt.ls.core.id1",
              "-Dosgi.bundles.defaultStartLevel=4",
              "-Declipse.product=org.eclipse.jdt.ls.core.product",
              "-Dlog.protocol=true",
              "-Dlog.level=ALL",
              "-Xmx1g",
              "--add-modules=ALL-SYSTEM",
              "--add-opens", "java.base/java.util=ALL-UNNAMED",
              "--add-opens", "java.base/java.lang=ALL-UNNAMED",
              "-jar", launcher,
              "-configuration", jdtls_path .. "/config_" .. os_cfg,
              "-data", workspace,
            },
            root_dir = jdtls.setup.find_root({
              ".git", "mvnw", "gradlew", "pom.xml", "build.gradle",
            }),
            capabilities = require("blink.cmp").get_lsp_capabilities(),
            settings = {
              java = {
                signatureHelp = { enabled = true },
                sources = {
                  organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                  },
                },
                codeGeneration = {
                  toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                  },
                  useBlocks = true,
                },
                inlayHints = { parameterNames = { enabled = "all" } },
              },
            },
          })
        end,
      })
    end,
  },
}
