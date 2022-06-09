require('staline').setup {
	defaults = {
		left_separator  = "",
		right_separator = "",
		cool_symbol     = " ",      
		full_path       = false,
		mod_symbol      = "  ",
		lsp_client_symbol = " ",
		line_column     = "%l/%c ", --"%l/%c 並%p% ", 
		fg              = "#000000",  
		bg              = "none",    
		inactive_color  = "#303030",
		inactive_bgcolor = "none",
		true_colors     = false,       
		font_active     = "bold,italic",   
		branch_symbol   = " ",
	},
	mode_colors = {
		n = "#2bbb4f",
		i = "#986fec",
		c = "#e27d60",
		v = "#4799eb", 
	},
	mode_icons = {
		n = " NORMAL",
		i = " INSERT",
		c = " COMMAND",
		v = " VISUAL",   
		V = " VISUAL",   
	},
	sections = {
		left = { '- ', '-mode', 'left_sep', ' ', 'branch' },
		mid  = { 'file_name' },
		right = { 'cool_symbol','right_sep', '-line_column' },	
	},
	special_table = {
		NvimTree = { 'NvimTree', ' ' },
		packer = { 'Packer',' ' },        
	},
	lsp_symbols = {
		Error=" ",
		Info=" ",
		Warn=" ",
		Hint="",
	},
}

