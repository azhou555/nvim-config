local M = {}

-- Each entry: name = colorscheme string passed to :colorscheme,
-- before = optional setup fn called first (required for schemes with variants).
M.schemes = {
  {
    name = "catppuccin-mocha",
    before = function()
      require("catppuccin").setup({ flavour = "mocha", transparent_background = false })
    end,
  },
  {
    name = "catppuccin-macchiato",
    before = function()
      require("catppuccin").setup({ flavour = "macchiato" })
    end,
  },
  { name = "tokyonight-night" },
  { name = "tokyonight-moon" },
  { name = "kanagawa-wave" },
  { name = "kanagawa-dragon" },
  { name = "rose-pine" },
  { name = "rose-pine-moon" },
  { name = "oxocarbon" },
  { name = "cyberdream" },
  {
    name = "fluoromachine",
    before = function()
      require("fluoromachine").setup({ glow = false, theme = "fluoromachine" })
    end,
  },
  {
    name = "retrowave",
    before = function()
      require("fluoromachine").setup({ glow = true, theme = "retrowave" })
    end,
  },
  {
    name = "delta",
    before = function()
      require("fluoromachine").setup({ glow = false, theme = "delta" })
    end,
  },
  { name = "everforest" },
  { name = "poimandres" },
  { name = "melange" },
  { name = "dracula" },
  { name = "nightfly" },
  { name = "bamboo" },
}

function M.load()
  math.randomseed(os.time())
  local idx = math.random(#M.schemes)
  local scheme = M.schemes[idx]

  if scheme.before then
    local ok, err = pcall(scheme.before)
    if not ok then
      vim.notify("Colorscheme setup failed: " .. tostring(err), vim.log.levels.WARN)
    end
  end

  local ok, err = pcall(vim.cmd.colorscheme, scheme.name)
  if not ok then
    vim.notify("Colorscheme '" .. scheme.name .. "' failed: " .. tostring(err), vim.log.levels.WARN)
    pcall(vim.cmd.colorscheme, "habamax")
  end
end

return M
