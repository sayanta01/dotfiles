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
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Plugins
return packer.startup(function(use)
  use "wbthomason/packer.nvim" 
  use 'tamton-aquib/staline.nvim'
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"  
  use "navarasu/onedark.nvim"
  use "lewis6991/impatient.nvim"
  use "goolord/alpha-nvim"
  use "norcalli/nvim-colorizer.lua"
  use "numToStr/Comment.nvim" 

--  use "nvim-telescope/telescope.nvim"
  
--  use "folke/which-key.nvim"
--  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
--  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
--  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
--  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
--  use "norcalli/nvim-colorizer.lua"
--  use "lukas-reineke/indent-blankline.nvim"
--  use "akinsho/bufferline.nvim"
  
--  use "moll/vim-bbye"
--  use "akinsho/toggleterm.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
--  use "neovim/nvim-lspconfig" -- enable LSP
--  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
    
  -- Git
--  use "lewis6991/gitsigns.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)