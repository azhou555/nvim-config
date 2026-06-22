local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Appearance
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false        -- lualine handles this
opt.cmdheight = 0           -- hidden until used; noice takes over
opt.pumheight = 10
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.colorcolumn = "100"
opt.conceallevel = 0
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Folding (nvim-ufo takes over at runtime)
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Files
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undodir"

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Misc
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.timeoutlen = 300
opt.updatetime = 200
opt.confirm = true
opt.virtualedit = "block"
opt.inccommand = "nosplit"   -- live preview of :s substitutions
opt.smoothscroll = true

-- Don't auto-insert comment leaders on o/O or Enter
opt.formatoptions:remove({ "c", "r", "o" })
