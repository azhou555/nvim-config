return {
  -- Classic: make it rain / game of life on your buffer
  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>cr", "<cmd>CellularAutomaton make_it_rain<cr>",   desc = "Make it rain" },
      { "<leader>cg", "<cmd>CellularAutomaton game_of_life<cr>",   desc = "Game of life" },
    },
  },

  -- Falling particles screensaver on the dashboard
  {
    "folke/drop.nvim",
    event = "VimEnter",
    config = function()
      -- Randomise the particle theme each session
      local themes = { "snow", "stars", "xmas", "spring", "summer", "leaves", "ash" }
      math.randomseed(os.time() + 1)   -- offset so it differs from colorscheme seed
      local pick = themes[math.random(#themes)]
      require("drop").setup({
        theme = pick,
        max = 40,
        interval = 100,
        screensaver = 1000 * 60 * 5,   -- 5 min idle
        filetypes = { "dashboard", "snacks_dashboard" },
      })
    end,
  },

  -- Focused writing / deep work mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = {
      { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Zen mode" },
    },
    opts = {
      window = {
        backdrop = 0.92,
        width = 100,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          foldcolumn = "0",
        },
      },
      plugins = {
        options = { enabled = true, ruler = false, showcmd = false, laststatus = 0 },
        twilight = { enabled = true },
        gitsigns  = { enabled = false },
        tmux      = { enabled = false },
      },
    },
  },

  -- Dim inactive code outside the current scope
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    keys = {
      { "<leader>uT", "<cmd>Twilight<cr>", desc = "Twilight (dim inactive)" },
    },
    opts = {
      dimming = { alpha = 0.25, color = { "Normal", "#ffffff" } },
      context = 15,
      treesitter = true,
    },
  },
}
