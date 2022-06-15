local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { "c", "javascript", "typescript", "lua", "css", "python", "bash", "html", "vim" },
  sync_install = false, 
  ignore_install = { "" }, 
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "latex" }, 
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
        -- Languages that have a single comment style
        typescript = "// %s",
        css = "/* %s */",
        scss = "/* %s */",
        html = "<!-- %s -->",
        svelte = "<!-- %s -->",
        vue = "<!-- %s -->",
        json = "",
     },
     rainbow = {
      enable = false,
      extended_mode = true, 
      max_file_lines = 999, 
    },
  },
}
