local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "norcalli/nvim-colorizer.lua"
  use "p00f/nvim-ts-rainbow"
  use "numToStr/Comment.nvim"
  use "moll/vim-bbye"
  use "goolord/alpha-nvim"
  use "lewis6991/impatient.nvim"
  use "LunarVim/darkplus.nvim"
  use "LunarVim/onedarker.nvim"
  use "folke/tokyonight.nvim"
  use "windwp/nvim-autopairs" -- Autopairs, integrates with cmp & treesitter
  use "nvim-lualine/lualine.nvim"
  use "ahmedkhalf/project.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "akinsho/bufferline.nvim"
  use "akinsho/toggleterm.nvim"
  use "kyazdani42/nvim-tree.lua"
  use "ahmedkhalf/project.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use "nvim-telescope/telescope.nvim"
  use "folke/which-key.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lua"
  use "f3fora/cmp-spell"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim" -- formatters & linters
  use "RRethy/vim-illuminate"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- DAP
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "ravenxrz/DAPInstall.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"
end)
