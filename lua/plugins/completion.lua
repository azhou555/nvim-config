return {
  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      local ls = require("luasnip")
      -- Jump between snippet nodes
      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        if ls.expand_or_jumpable() then ls.expand_or_jump() end
      end, { silent = true, desc = "Snippet: expand or jump forward" })
      vim.keymap.set({ "i", "s" }, "<C-h>", function()
        if ls.jumpable(-1) then ls.jump(-1) end
      end, { silent = true, desc = "Snippet: jump backward" })
    end,
  },

  -- Completion engine
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "L3MON4D3/LuaSnip" },
    version = "*",
    opts = {
      keymap = {
        preset = "default",
        -- Accept with Tab, cycle with arrows or C-n/C-p
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "cancel", "fallback" },
        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
      appearance = {
        nerd_font_variant = "mono",
        kind_icons = {
          Text          = "󰉿",
          Method        = "󰆧",
          Function      = "󰊕",
          Constructor   = "",
          Field         = "󰜢",
          Variable      = "󰀫",
          Class         = "󰠱",
          Interface     = "",
          Module        = "",
          Property      = "󰜢",
          Unit          = "󰑭",
          Value         = "󰎠",
          Enum          = "",
          Keyword       = "󰌋",
          Snippet       = "",
          Color         = "󰏘",
          File          = "󰈙",
          Reference     = "󰈇",
          Folder        = "󰉋",
          EnumMember    = "",
          Constant      = "󰏿",
          Struct        = "󰙅",
          Event         = "",
          Operator      = "󰆕",
          TypeParameter = "",
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          buffer = {
            -- Include visible buffers for completions, not just current
            opts = { get_bufnrs = vim.api.nvim_list_bufs },
          },
        },
      },
      snippets = { preset = "luasnip" },
      signature = {
        enabled = true,
        window = { border = "rounded" },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "rounded" },
        },
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind", gap = 1 },
            },
          },
        },
        ghost_text = { enabled = true },
      },
    },
  },
}
