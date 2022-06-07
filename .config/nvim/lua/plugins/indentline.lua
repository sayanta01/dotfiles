require("indent_blankline").setup {
  buftype_exclude = { "terminal" , "nofile" },
  filetype_exclude = { "help", "startify", "Trouble", "dashboard", "NvimTree", "packer", "lsp-installer" },
  show_current_context = true,
--  show_first_indent_level = true,
--  show_trailing_blankline_indent = false,
  use_treesitter = true,
  context_patterns = {
    "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object",
    "^table", "block", "arguments", "if_statement", "else_clause", "jsx_element",
    "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
    "operation_type"
  }
}

--vim.g.indent_blankline_char = "│"
--vim.wo.colorcolumn = "99999"

--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

--vim.opt.list = true
--vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")

--require("indent_blankline").setup {
   --space_char_blankline = " ",
   --char_highlight_list = {
       --"IndentBlanklineIndent1",
       --"IndentBlanklineIndent2",
       --"IndentBlanklineIndent3",
       --"IndentBlanklineIndent4",
       --"IndentBlanklineIndent5",
       --"IndentBlanklineIndent6",
   --},
--}

