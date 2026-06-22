return {
  -- Label-based navigation (augments / and f/t)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = { enabled = true },
        char   = {
          enabled = true,
          jump_labels = true,
        },
      },
    },
    keys = {
      { "s",     function() require("flash").jump() end,              desc = "Flash jump",              mode = { "n", "x", "o" } },
      { "S",     function() require("flash").treesitter() end,        desc = "Flash treesitter select", mode = { "n", "x", "o" } },
      { "r",     function() require("flash").remote() end,            desc = "Flash remote",            mode = "o" },
      { "R",     function() require("flash").treesitter_search() end, desc = "Flash treesitter search", mode = { "o", "x" } },
      { "<C-s>", function() require("flash").toggle() end,            desc = "Flash toggle search",     mode = "c" },
    },
  },

  -- Surround operations: ys, cs, ds
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  -- Enhanced text objects (mini.ai)
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    config = function()
      local ai = require("mini.ai")
      ai.setup({
        n_lines = 500,
        custom_textobjects = {
          -- Whole buffer
          B = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          -- Function with treesitter
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          -- Class
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
      })
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = {
        lua  = { "string" },
        python = { "string" },
        javascript = { "template_string" },
      },
      fast_wrap = {
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    },
  },

  -- Keymap cheatsheet popup
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      delay = 300,
      icons = { mappings = true },
      spec = {
        { "<leader>b",  group = "buffers" },
        { "<leader>c",  group = "code / fun" },
        { "<leader>f",  group = "find" },
        { "<leader>g",  group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>l",  group = "lsp" },
        { "<leader>n",  group = "neo-tree" },
        { "<leader>s",  group = "swap" },
        { "<leader>t",  group = "terminal / trouble" },
        { "<leader>u",  group = "ui" },
        { "]]",         desc  = "Next reference" },
        { "[[",         desc  = "Prev reference" },
        { "]h",         desc  = "Next hunk" },
        { "[h",         desc  = "Prev hunk" },
        { "]d",         desc  = "Next diagnostic" },
        { "[d",         desc  = "Prev diagnostic" },
        { "]f",         desc  = "Next function" },
        { "[f",         desc  = "Prev function" },
      },
    },
  },

  -- Pretty diagnostics, references, quickfix, location list
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>td",  "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (workspace)" },
      { "<leader>tD",  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
      { "<leader>ts",  "<cmd>Trouble symbols toggle<cr>",                  desc = "Symbols" },
      { "<leader>tl",  "<cmd>Trouble lsp toggle<cr>",                      desc = "LSP definitions / refs" },
      { "<leader>tq",  "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix list" },
      { "<leader>tL",  "<cmd>Trouble loclist toggle<cr>",                  desc = "Location list" },
    },
    opts = { use_diagnostic_signs = true },
  },

  -- Highlight and search TODO/FIXME/HACK/NOTE
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
      { "<leader>ft", "<cmd>TodoFzfLua<cr>",                       desc = "Find TODOs" },
    },
    opts = { signs = true },
  },
}
