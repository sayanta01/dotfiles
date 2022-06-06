-- For Null-LS formatting
--pip3 install pynvim black flake8
--cargo install stylua
--sudo apt install -y ueberzug eslint 
--sudo npm install -g prettier

require "options"
vim.cmd "colorscheme onedark"
--require "keymaps"

require "plugins"
require "plugins.alpha"
require "plugins.staline"
require "plugins.impatient"
require "plugins.colorizer"
require "plugins.autopairs"
require "plugins.cmp"

require "plugins.nvim-tree"
require "plugins.treesitter"


