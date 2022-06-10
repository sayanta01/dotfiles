local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
--vim.cmd [[
--  augroup packer_user_config
--   autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--  augroup end
--]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Plugins
return packer.startup(function(use)
  use "wbthomason/packer.nvim" 
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugin
  use "navarasu/onedark.nvim"
  se 'folke/tokyonight.nvim'
  use "ellisonleao/gruvbox.nvim"
  use "lewis6991/impatient.nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "goolord/alpha-nvim"
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "norcalli/nvim-colorizer.lua"
  use "p00f/nvim-ts-rainbow"
  use "akinsho/toggleterm.nvim"
  use "numToStr/Comment.nvim"   
  use "lukas-reineke/indent-blankline.nvim"

  use "akinsho/bufferline.nvim"  
  use 'tamton-aquib/staline.nvim'
  use "nvim-telescope/telescope-media-files.nvim"
  use "kyazdani42/nvim-tree.lua"  
  use "nvim-telescope/telescope.nvim"
  use "folke/which-key.nvim"
    
--use "moll/vim-bbye"   
--use "lewis6991/gitsigns.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" 
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip" 
  use "hrsh7th/cmp-buffer" 
  use "hrsh7th/cmp-path" 
  use "hrsh7th/cmp-cmdline" 

  -- Snippets
  use "L3MON4D3/LuaSnip" 
  use "rafamadriz/friendly-snippets" 

  -- LSP
--  use "neovim/nvim-lspconfig" -- enable LSP
--  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

