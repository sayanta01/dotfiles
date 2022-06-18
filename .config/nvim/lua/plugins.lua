local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Popup window
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
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  use "LunarVim/darkplus.nvim"
  use "LunarVim/onedarker.nvim"
  use 'folke/tokyonight.nvim'
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "p00f/nvim-ts-rainbow"
  use "norcalli/nvim-colorizer.lua"
  use "numToStr/Comment.nvim"   
  use "moll/vim-bbye"   
  use "goolord/alpha-nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "akinsho/toggleterm.nvim"
  --use "nvim-telescope/telescope-media-files.nvim"
  use "windwp/nvim-autopairs" -- Autopairs, integrates cmp & treesitter
  use "RRethy/vim-illuminate"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  
  use "nvim-telescope/telescope.nvim"
  use "kyazdani42/nvim-tree.lua"  
  use "akinsho/bufferline.nvim"  
  use "folke/which-key.nvim"
    
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
    use "neovim/nvim-lspconfig" 
    use "williamboman/nvim-lsp-installer" 
    use "jose-elias-alvarez/null-ls.nvim" -- formatters & linters
    --use "tamago324/nlsp-settings.nvim" 
    
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

