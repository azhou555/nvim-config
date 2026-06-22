return {
  -- Edit the filesystem like a buffer
  {
    "stevearc/oil.nvim",
    dependencies = { "echasnovski/mini.icons" },
    keys = {
      { "<leader>e", "<cmd>Oil<cr>",          desc = "Open Oil (parent dir)" },
      { "<leader>E", "<cmd>Oil .<cr>",         desc = "Open Oil (cwd)" },
    },
    opts = {
      default_file_explorer = true,   -- replaces netrw
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      buf_options = { buflisted = false, bufhidden = "hide" },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name)
          return name == ".DS_Store"
        end,
      },
      float = {
        padding = 2,
        max_width = 90,
        max_height = 0,
        border = "rounded",
      },
      keymaps = {
        ["g?"]  = "actions.show_help",
        ["<CR>"]= "actions.select",
        ["<C-v>"]= { "actions.select", opts = { vertical = true } },
        ["<C-x>"]= { "actions.select", opts = { horizontal = true } },
        ["<C-t>"]= { "actions.select", opts = { tab = true } },
        ["<C-p>"]= "actions.preview",
        ["<C-c>"]= "actions.close",
        ["<C-r>"]= "actions.refresh",
        ["-"]   = "actions.parent",
        ["_"]   = "actions.open_cwd",
        ["`"]   = "actions.cd",
        ["~"]   = { "actions.cd", opts = { scope = "tab" } },
        ["gs"]  = "actions.change_sort",
        ["gx"]  = "actions.open_external",
        ["g."]  = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
    },
  },

  -- Traditional tree sidebar
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>n",  "<cmd>Neotree toggle<cr>",                  desc = "Neo-tree toggle" },
      { "<leader>nf", "<cmd>Neotree reveal<cr>",                  desc = "Neo-tree reveal file" },
      { "<leader>ng", "<cmd>Neotree git_status<cr>",              desc = "Neo-tree git status" },
      { "<leader>nb", "<cmd>Neotree buffers<cr>",                 desc = "Neo-tree buffers" },
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
        },
        modified = { symbol = "[+]" },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          },
        },
      },
      window = {
        position = "left",
        width = 35,
        mapping_options = { noremap = true, nowait = true },
      },
      filesystem = {
        filtered_items = {
          visible = true,   -- show hidden, just dimmed
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = { ".DS_Store", "thumbs.db", "__pycache__" },
        },
        follow_current_file = { enabled = true },
        group_empty_dirs = true,
        use_libuv_file_watcher = true,
      },
      buffers = { follow_current_file = { enabled = true } },
      git_status = { window = { position = "float" } },
    },
  },
}
