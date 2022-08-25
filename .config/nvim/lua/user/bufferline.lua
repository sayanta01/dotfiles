local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none",
    close_command = "bdelete! %d",
    middle_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    right_mouse_command = nil,
    indicator = " ", --▎
    buffer_close_icon = "", --窱
    modified_icon = "",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 28,
    max_prefix_length = 28,
    tab_size = 20,
    diagnostics = false, --"nvim_lsp",
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },
  --[[ highlights = { ]]
  --[[   fill = { ]]
  --[[     guifg = { attribute = "fg", highlight = "#ff0000" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[   }, ]]
  --[[   background = { ]]
  --[[     guifg = { attribute = "fg", highlight = "TabLine" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[   }, ]]
  --[[]]
  --[[   -- buffer_selected = { ]]
  --[[   --   guifg = {attribute='fg',highlight='#ff0000'}, ]]
  --[[   --   guibg = {attribute='bg',highlight='#0000ff'}, ]]
  --[[   --   gui = 'none' ]]
  --[[   --   }, ]]
  --[[   buffer_visible = { ]]
  --[[     guifg = { attribute = "fg", highlight = "TabLine" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[   }, ]]
  --[[]]
  --[[   close_button = { ]]
  --[[     guifg = { attribute = "fg", highlight = "TabLine" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[   }, ]]
  --[[   close_button_visible = { ]]
  --[[     guifg = { attribute = "fg", highlight = "TabLine" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[   }, ]]
  --[[   -- close_button_selected = { ]]
  --[[   --   guifg = {attribute='fg',highlight='TabLineSel'}, ]]
  --[[   --   guibg ={attribute='bg',highlight='TabLineSel'} ]]
  --[[   --   }, ]]
  --[[]]
  --[[   tab_selected = { ]]
  --[[     guifg = { attribute = "fg", highlight = "Normal" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "Normal" }, ]]
  --[[   }, ]]
  --[[   tab = { ]]
  --[[     guifg = { attribute = "fg", highlight = "TabLine" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[   }, ]]
  --[[   tab_close = { ]]
  --[[     -- guifg = {attribute='fg',highlight='LspDiagnosticsDefaultError'}, ]]
  --[[     guifg = { attribute = "fg", highlight = "TabLineSel" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "Normal" }, ]]
  --[[   }, ]]
  --[[]]
  --[[   duplicate_selected = { ]]
  --[[     guifg = { attribute = "fg", highlight = "TabLineSel" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLineSel" }, ]]
  --[[     gui = "italic", ]]
  --[[   }, ]]
  --[[   duplicate_visible = { ]]
  --[[     guifg = { attribute = "fg", highlight = "TabLine" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[     gui = "italic", ]]
  --[[   }, ]]
  --[[   duplicate = { ]]
  --[[     guifg = { attribute = "fg", highlight = "TabLine" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[     gui = "italic", ]]
  --[[   }, ]]
  --[[]]
  --[[   modified = { ]]
  --[[     guifg = { attribute = "fg", highlight = "TabLine" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[   }, ]]
  --[[   modified_selected = { ]]
  --[[     guifg = { attribute = "fg", highlight = "Normal" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "Normal" }, ]]
  --[[   }, ]]
  --[[   modified_visible = { ]]
  --[[     guifg = { attribute = "fg", highlight = "TabLine" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[   }, ]]
  --[[]]
  --[[   separator = { ]]
  --[[     guifg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "TabLine" }, ]]
  --[[   }, ]]
  --[[   separator_selected = { ]]
  --[[     guifg = { attribute = "bg", highlight = "Normal" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "Normal" }, ]]
  --[[   }, ]]
  --[[   -- separator_visible = { ]]
  --[[   --   guifg = {attribute='bg',highlight='TabLine'}, ]]
  --[[   --   guibg = {attribute='bg',highlight='TabLine'} ]]
  --[[   --   }, ]]
  --[[   indicator_selected = { ]]
  --[[     guifg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" }, ]]
  --[[     guibg = { attribute = "bg", highlight = "Normal" }, ]]
  --[[   }, ]]
  --[[ }, ]]
}
