local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

  -- Modes
--   term_mode = "t",
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   command_mode = "c",
--   visual_block_mode = "x",

-- Wrap Text 
keymap("n", "<C-w>", "<ESC>:set wrap <CR>", opts)
-- keymap("i", "<C-w>", "<ECS>:set wrap <CR>", opts)
keymap("v", "<C-w>", "<ESC>:set wrap <CR>", opts)

-- No Wrap Text 
keymap("n", "<C-M-w>", "<ESC>:set nowrap <CR>", opts)
keymap("i", "<C-M-w>", "<ESC>:set nowrap <CR>", opts)
keymap("v", "<C-M-w>", "<ESC>:set nowrap <CR>", opts)


-- Normal --
-- Copy whole file
keymap("n", "<C-c-a>", ":%y+ <CR>", opts)

-- Beginning & End
keymap("n", "<C-b>", "<ESC>^i", opts)
keymap("n", "<C-e>", "<End>", opts)

-- Line num
keymap("n", "<leader>n", "<cmd> set nu! <CR>", opts)
keymap("n", "<leader>nn", "<cmd> set rnu! <CR>", opts)
keymap("n", "<leader>m", "<cmd> set cursorcolumn! <CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-o>","<cmd>BufferLineMoveNext<cr>", opts)
keymap("n", "<S-i>","<cmd>BufferLineMovePrev<cr>", opts)

-- New buffer
keymap("n", "<S-b>", ":enew <CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap("n", "<C-v>", "<cmd>vsplit<cr>", opts)
keymap("n", "<C-s>", "<cmd>split<cr>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)


-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- go to  beginning and end
keymap("i", "<C-b>", "<ESC>^i", opts)
keymap("i", "<C-e>", "<End>", opts)

-- navigate within insert mode
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-l>", "<Right>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


