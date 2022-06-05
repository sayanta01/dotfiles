-- For Null-LS formatting
--pip3 install pynvim black flake8
--cargo install stylua
--sudo apt install -y  eslint 
--sudo npm install -g prettier

require "options"
--require "keymaps"
vim.cmd "colorscheme onedark"

require "plugins"
require "plugins.cmp"
require "plugins.alpha"
require "plugins.staline"
require "plugins.colorizer"
require "plugins.nvim-tree"
