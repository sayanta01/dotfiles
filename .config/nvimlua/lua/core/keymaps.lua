local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local kmap = vim.api.nvim_set_keymap

-- Remap space as Leader key
kmap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"
--   visual_block_mode = "x"
--   term_mode = "t"
--   command_mode = "c"


-- Normal
-- Better window navigation
kmap("n", "<C-h>", "<C-w>h", opts)
kmap("n", "<C-j>", "<C-w>j", opts)
kmap("n", "<C-k>", "<C-w>k", opts)
kmap("n", "<C-l>", "<C-w>l", opts)

-- Copy whole file
kmap("n", "<C-c>", "<cmd> %y+ <CR>", opts)

-- Close buffer without saving
kmap("n", "<leader>D", ":Bwipeout!<cr>", opts) 

-- Navigate buffers 
kmap("n", "<S-l>", ":bnext<CR>", opts)
kmap("n", "<S-h>", ":bprevious<CR>", opts)

-- New buffer
kmap("n", "<S-b>", "<cmd> enew <CR>", opts)

-- Resize with arrows
kmap("n", "<C-Up>", ":resize -2<CR>", opts)
kmap("n", "<C-Down>", ":resize +2<CR>", opts)
kmap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
kmap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Move text up and down
kmap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
kmap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)


-- Insert --
-- Press jk fast to enter
kmap("i", "jk", "<ESC>", opts)


-- Visual --
-- Stay in indent mode
kmap("v", "<", "<gv", opts)
kmap("v", ">", ">gv", opts)


-- Move text up and down
kmap("v", "<A-j>", ":m .+1<CR>==", opts)
kmap("v", "<A-k>", ":m .-2<CR>==", opts)
kmap("v", "p", '"_dP', opts)


-- Visual Block --
-- Move text up and down
kmap("x", "J", ":move '>+1<CR>gv-gv", opts)
kmap("x", "K", ":move '<-2<CR>gv-gv", opts)
kmap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
kmap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

