return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      { "<leader>gg", function() Snacks.lazygit() end,                    desc = "Lazygit" },
      { "<leader>gL", function() Snacks.lazygit.log() end,                desc = "Lazygit log" },
      { "<leader>gl", function() Snacks.lazygit.log_file() end,           desc = "Lazygit file log" },
      { "<leader>tt", function() Snacks.terminal() end,                   desc = "Terminal (float)" },
      { "<leader>tT", function() Snacks.terminal(nil, { win = { position = "bottom" } }) end, desc = "Terminal (bottom)" },
      { "<leader>uZ", function() Snacks.zen() end,                        desc = "Zen mode" },
      { "<leader>uz", function() Snacks.zen.zoom() end,                   desc = "Zoom window" },
      { "<leader>un", function() Snacks.notifier.hide() end,              desc = "Dismiss notifications" },
      { "<leader>uh", function() Snacks.notifier.show_history() end,      desc = "Notification history" },
      { "<leader>bd", function() Snacks.bufdelete() end,                  desc = "Delete buffer" },
      { "<leader>cR", function() Snacks.rename.rename_file() end,         desc = "Rename file" },
      { "]]",         function() Snacks.words.jump(vim.v.count1) end,     desc = "Next word reference",  mode = { "n", "t" } },
      { "[[",         function() Snacks.words.jump(-vim.v.count1) end,    desc = "Prev word reference",  mode = { "n", "t" } },
    },
    opts = {
      -- Startup dashboard
      dashboard = {
        enabled = true,
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          keys = {
            { icon = " ", key = "f", desc = "Find File",       action = "<cmd>FzfLua files<cr>" },
            { icon = " ", key = "n", desc = "New File",        action = "<cmd>ene | startinsert<cr>" },
            { icon = " ", key = "g", desc = "Find Text",       action = "<cmd>FzfLua live_grep<cr>" },
            { icon = " ", key = "r", desc = "Recent Files",    action = "<cmd>FzfLua oldfiles<cr>" },
            { icon = " ", key = "c", desc = "Config",          action = "<cmd>e $MYVIMRC<cr>" },
            { icon = " ", key = "s", desc = "Restore Session", action = [[<cmd>lua require("persistence").load()<cr>]] },
            { icon = "󰒲 ", key = "l", desc = "Lazy",           action = "<cmd>Lazy<cr>", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit",            action = "<cmd>qa<cr>" },
          },
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps",      section = "keys",         indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1, limit = 5 },
          { icon = " ", title = "Projects",     section = "projects",     indent = 2, padding = 1 },
          { section = "startup" },
        },
      },

      -- Notification system (replaces nvim-notify)
      notifier = {
        enabled = true,
        timeout = 3000,
        width = { min = 40, max = 0.4 },
        height = { min = 1, max = 0.6 },
        style = "compact",
        top_down = false,
      },

      -- Lazygit integration
      lazygit = { enabled = true },

      -- Floating terminal
      terminal = {
        enabled = true,
        win = {
          style = "terminal",
          border = "rounded",
          height = 0.8,
          width = 0.8,
        },
      },

      -- Smooth scroll + indent animations
      scroll = { enabled = true },
      animate = { enabled = true },
      indent = {
        enabled = true,
        animate = { enabled = true },
        scope = { enabled = false },  -- ibl handles scope highlighting
      },

      -- Highlight word references (pairs with vim-illuminate)
      words = { enabled = true },

      -- Zen mode
      zen = {
        enabled = true,
        zoom = { toggles = {}, show = { statusline = false, tabline = false } },
        win = { backdrop = { transparent = true, blend = 40 } },
      },

      -- Large file handling (disables slow features on big files)
      bigfile = { enabled = true },

      -- Input UI (replaces vim.ui.input)
      input = { enabled = true },

      -- Scope
      scope = { enabled = true },

      -- Statuscolumn
      statuscolumn = { enabled = true },
    },
    config = function(_, opts)
      require("snacks").setup(opts)

      -- Override vim.notify with snacks notifier
      vim.notify = Snacks.notify

      -- Create global Snacks convenience aliases
      _G.dd = function(...)
        Snacks.debug.inspect(...)
      end
      _G.bt = function()
        Snacks.debug.backtrace()
      end
    end,
  },
}
