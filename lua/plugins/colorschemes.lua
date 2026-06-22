-- All colorscheme plugins load eagerly at startup (priority 1000)
-- so the random picker in config/colorscheme.lua can require() any of them.
return {
  { "catppuccin/nvim",               name = "catppuccin",  lazy = false, priority = 1000 },
  { "folke/tokyonight.nvim",                               lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim",                               lazy = false, priority = 1000 },
  { "rose-pine/neovim",              name = "rose-pine",   lazy = false, priority = 1000 },
  { "nyoom-engineering/oxocarbon.nvim",                    lazy = false, priority = 1000 },
  { "scottmckendry/cyberdream.nvim",                       lazy = false, priority = 1000 },
  { "maxmx03/fluoromachine.nvim",                          lazy = false, priority = 1000 },
  { "neanias/everforest-nvim",                             lazy = false, priority = 1000 },
  { "olivercederborg/poimandres.nvim",                     lazy = false, priority = 1000 },
  { "savq/melange-nvim",                                   lazy = false, priority = 1000 },
  { "Mofiqul/dracula.nvim",                                lazy = false, priority = 1000 },
  { "bluz71/vim-nightfly-colors",    name = "nightfly",    lazy = false, priority = 1000 },
  { "ribru17/bamboo.nvim",                                 lazy = false, priority = 1000 },
}
