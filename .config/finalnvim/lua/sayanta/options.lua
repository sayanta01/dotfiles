local opt = vim.opt
local g = vim.g

-- Performance
--opt.fileencoding = "utf-8"
--opt.writebackup = false
--opt.lazyredraw = true
--opt.swapfile = false
--opt.conceallevel = 0 
opt.hidden = true
opt.undofile = true
opt.timeoutlen = 99
opt.updatetime = 300
opt.backup = false

-- UI
--opt.guifont = "monospace:h17",               -- font used in graphical neovim applications
--opt.cmdheight = 2
--opt.showtabline = 2
--opt.confirm = true
--opt.pumheight = 9
--opt.showmode = false
--opt.completeopt = { "menuone", "noselect" }
opt.whichwrap:append "<>[]hl"
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = true -- cursor line
opt.signcolumn = "yes"


-- Tabs
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 4


-- Search
--opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true

-- Numbers
--opt.wrap = false
-- opt.relativenumber = true
opt.number = true
opt.scrolloff = 6
opt.sidescrolloff = 8


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
   --"shada_plugin,
   "tar",
   "logiPat",
   "spellfile_plugin",
   "rrhelper",
   "vimball",
   "vimballPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "remote_plugins",
   "tutor_mode_plugin",
   "shada_plugin",
   "matchparen",
   "matchit",
}

for _, plugin in pairs(default_plugins) do
   g["loaded_" .. plugin] = 1
end


-- set shada path
vim.schedule(function()
   vim.opt.shadafile = vim.fn.expand "$HOME" .. "/.local/share/nvim/shada/main.shada"
   vim.cmd [[ silent! rsh ]]
end)
