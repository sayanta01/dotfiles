-- For Null-LS formatting
--pip3 install pynvim black flake8
--cargo install stylua
--sudo apt install -y ueberzug eslint golang-go gccgo-go
--sudo npm install -g prettier

require "options"
vim.cmd "colorscheme onedark"
--require "keymaps"

require "plugins"
require "plugins.cmp"
require "plugins.alpha"
require "plugins.staline"
require "plugins.comment"
require "plugins.whichkey"
require "plugins.colorizer"
require "plugins.autopairs"
require "plugins.telescope"
require "plugins.nvim-tree"
require "plugins.impatient"
require "plugins.bufferline"
require "plugins.toggleterm"
require "plugins.indentline"
require "plugins.treesitter"


