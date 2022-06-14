local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, 
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 24 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["E"] = { ":e ~/.config/nvim/init.lua<cr>", "Edit config" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
--  f = {"<cmd>Telescope find_files<cr>", "Find Files"},
  },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["Q"] = { ":wq<cr>", "Save & Quit" },
  ["r"] = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
  ["x"] = {":bdelete<cr>", "Close Buffer"},
  ["X"] = {":bdelete!<cr>", "Force Close Buffer"},

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
  },

    l = {
    name = "LSP",
    a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', "Code actions"},
    f = {'<cmd>lua vim.lsp.buf.formatting()<CR>', "Format File"},
    e = {'<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', "Show line diagnostics"},
    r = {'<cmd>lua vim.lsp.buf.references()<CR>', "References"},
    R = {'<cmd>lua vim.lsp.buf.rename()<CR>', "Rename"},
    i = {":LspInfo<cr>", "Connected Language Servers"},
    I = {'<cmd>LspInstallInfo<cr>', 'Install language server'},
    w = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', "Add workspace folder"},
    W = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', "Remove workspace folder"},
    n = {'<cmd>lua vim.diagnostic.goto_next()<CR>', "Go to next diagnostic"},
    N = {'<cmd>lua vim.diagnostic.goto_prev()<CR>', "Go to previous diagnostic"},
    k = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', "Signature help"},
    K = {'<cmd>lua vim.lsp.buf.hover()<CR>', "Hover"},
    t = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', "Type definition"},
    g = {'<cmd>lua vim.lsp.buf.definition()<CR>', "Go to definition"},
    G = {'<cmd>lua vim.lsp.buf.delaration()<CR>', "Go to declaration"},
    
    l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', "List workspace folder"},
   -- q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    m = { "<cmd>Telescope marks<CR>", "Marks" },
    d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
    D = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics"},
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"},
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  },
  
  s = {
    name = "Find with Telescope",
    b = { "<cmd>Telescope builtin<cr>", "Telescope builtin" },
    c = { "<cmd>Telescope lsp_code_actions<cr>", "Code Actions" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    d = { "<cmd>Telescope diagnostics<cr>", "Document Diagnostics" },
    D = { "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", "Line Diagnostics" },
    s = { "<cmd>lua vim.o.spell = not vim.o.spell<cr>", "Toggle spell check" },
    --S = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    
    --r = { "<cmd>Telescope lsp_references<cr>", "Find References" },
  },
  
  p = {
    name = "Packer",
    r = {":PackerClean<cr>", "Remove Unused Plugins"},
    c = {":PackerCompile profile=true<cr>", "Recompile Plugins"},
    i = {":PackerInstall<cr>", "Install Plugins"},
    s = {":PackerSync<cr>", "Sync Plugins"},
    S = {":PackerStatus<cr>", "Packer Status"},
    u = {":PackerUpdate<cr>", "Update Plugins"}
  },
  
  d = {
    name = "Bufferline",
    s = { "<cmd>BufferLinePick<CR>", "Pick" },
    l = { "<cmd>BufferLineCloseRight<CR>", "Close all to right" },
    h = { "<cmd>BufferLineCloseLeft<CR>", "Close all to left" },
    p = { "<cmd>BufferLineTogglePin<CR>", "Toggle pin" },
  },
  
  t = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    --f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
