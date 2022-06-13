local options = {
  --timeoutlen = 99,  
  encoding = "UTF-8",
  writebackup = false,                     
  swapfile = false,                        
  conceallevel = 0,                        
  hidden = true,
  undofile = true,                         
  updatetime = 300,                        
  backup = false,                          

  confirm = true,
  --cmdheight = 2,                           
  --showtabline = 2,                         
  --pumheight = 9,
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
}

for k,v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.opt.shortmess:append "c"

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


