local opt = vim.opt
local g = vim.g

-- Performance
opt.lazyredraw = true
opt.undofile = true
opt.writebackup = false
opt.timeoutlen = 360
opt.updatetime = 260
opt.swapfile = false
opt.fileencoding = "utf-8"
opt.backup = false

-- UI
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.showtabline = 2
opt.hidden = true
opt.completeopt = { "menuone", "noselect" }
opt.cmdheight = 2
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"

-- Tabs
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- Search
opt.hlsearch = true
opt.nohlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true

-- Numbers
opt.number = true
opt.scrolloff = 6
opt.sidescrolloff = 8
opt.numberwidth = 2
opt.relativenumber = true
opt.wrap = false


opt.wildmenu = true
opt.pumheight = 9


-- disable some builtin vim plugins
local default_plugins = {
   "2html_plugin",
   "getscriptPlugin",
   "getscript",
   "gzip",
   "netrw",
   "netrwPlugin",
   "tarPlugin",
   "zipPlugin",
   "zip",
   "tar",
   "logiPat",
   "spellfile_plugin",
   "rrhelper",
   "vimball",
   "vimballPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
}

vim.opt.shortmess:append "c"
vim.cmd "set whichwrap+=<,>,[,],h,l"

