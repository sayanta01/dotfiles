local options = {
  encoding = "UTF-8",
  writebackup = false,                     
  swapfile = false,                        
  conceallevel = 0,                        
  hidden = true,
  undofile = true,                         
  timeoutlen = 99,                        
  updatetime = 300,                        
  backup = false,                          

  --guifont = "monospace:h17",               
  --confirm = true,
  cmdheight = 2,                           
  showtabline = 2,                         
  pumheight = 9,                          
  showmode = false,                        
  completeopt = { "menuone", "noselect" }, 
  clipboard = "unnamedplus",               
  mouse = "a",                             
  splitbelow = true,                       
  splitright = true,                       
  termguicolors = true,                    
  cursorline = true,                       
  signcolumn = "yes",                      

  expandtab = true,                        
  shiftwidth = 2,                          
  tabstop = 2,                             

  hlsearch = false,                         
  ignorecase = true,                       
  smartcase = true,                       
  smartindent = true,                     

  wrap = false,                           
  number = true,                          
  relativenumber = false,                 
  scrolloff = 6,                          
  sidescrolloff = 8,
}

for k,v in pairs(options) do
  vim.opt[k] = v
end

--vim.opt.shortmess:append "c"


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
