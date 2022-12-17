local options = {
  timeoutlen = 400,
  encoding = "UTF-8",
  writebackup = false,
  swapfile = false,
  conceallevel = 0,
  hidden = true,
  undofile = true,
  updatetime = 300,
  backup = false,

  --cmdheight = 2,
  --showtabline = 2,
  --pumheight = 9,
  showcmd = false,
  confirm = true,
  spell = true,
  spelllang = { 'en_us' },
  termguicolors = true,
  showmode = true,
  completeopt = { "menuone", "noselect" },
  clipboard = "unnamedplus",
  mouse = "a",
  splitbelow = true,
  splitright = true,
  cursorline = true,
  signcolumn = "yes",

  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,

  hlsearch = true,
  ignorecase = true,
  smartcase = true,
  smartindent = true,

  wrap = false,
  number = true,
  --relativenumber = false,
  scrolloff = 6,
  sidescrolloff = 8,
  lazyredraw = true,
  copyindent = true,  --Copy the previous indentation on autoindenting
  fillchars = { eob = " " },  --Disable `~` on nonexistent lines
  preserveindent = true,  --Preserve indent structure as much as possible
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append("sI")
vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.fillchars.eob=" "

-- Disable builtin plugins
vim.g.loaded_zip = 1
vim.g.loaded_tar = 1
vim.g.loaded_gzip = 1
vim.g.loaded_netrw = 1
vim.g.loaded_matchit = 1
vim.g.loaded_vimball = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_getscript = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_tutor = 1
vim.g.loaded_optwin = 1
vim.g.loaded_syntax = 1
vim.g.loaded_synmenu = 1
vim.g.loaded_rplugin = 1
vim.g.loaded_compiler = 1
vim.g.loaded_ftplugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_bugreport = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_node_provider = 1
vim.g.loaded_ruby_provider = 1
vim.g.loaded_perl_provider = 1
vim.g.loaded_python_provider = 1
vim.g.loaded_python3_provider = 1
