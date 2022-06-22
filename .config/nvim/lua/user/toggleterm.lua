local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	shade_filetypes = {},
	shading_factor = 2,
	persist_size = true,
	hide_numbers = true,
	close_on_exit = true,
	shade_terminals = true,
	insert_mappings = true,
	start_in_insert = true,
	direction = "float",
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 20,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal
--local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

--function _LAZYGIT_TOGGLE()
	--lazygit:toggle()
--end

local node = Terminal:new({ cmd = "node", hidden = true })
function _NODE_TOGGLE()
	node:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })
function _PYTHON_TOGGLE()
	python:toggle()
end
