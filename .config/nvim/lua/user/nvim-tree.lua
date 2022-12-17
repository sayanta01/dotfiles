local present, nvimtree = pcall(require, "nvim-tree")
if not present then
  return
end

local options = {
  filters = {
    dotfiles = false,
    exclude = { "custom" },
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = { "alpha" },
  open_on_tab = false,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 28,
   -- height = 28,
    hide_root_folder = false,
    side = "left",
  },
  git = {
    enable = false,
    ignore = true,
    timeout = 200,
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = false,
      },
    },
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",

    indent_markers = {
      enable = false,
    },
    icons = {
      padding = " ",
      symlink_arrow = "  ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

-- check for any override
nvimtree.setup(options)

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

-- Replaces auto_close
local tree_cb = nvim_tree_config.nvim_tree_callback
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
