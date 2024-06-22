-- lua/plugins.lua

local success, packer = pcall(require, "packer")
if (not success) then
  print("Packer not found!")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  -- Plugins go here
  use 'wbthomason/packer.nvim'
  use "ayu-theme/ayu-vim"
  use "rose-pine/neovim"
  use "savq/melange-nvim"
  use 'jacoborus/tender.vim'
  use "rebelot/kanagawa.nvim"
  use 'chriskempson/base16-vim'
  use 'morhetz/gruvbox'
  use { 'rose-pine/neovim', as = 'rose-pine' }

  -- LSP Base
  -- Configs for Nvim LSP Client
  use { 'neovim/nvim-lspconfig' }
  -- Easily install and manage LSP servers, DAP servers, linters, and formatters
  use { 'williamboman/mason.nvim' }
  -- Bridges mason.nvim with the lspconfig
  use { 'williamboman/mason-lspconfig.nvim' }
  use 'simrat39/rust-tools.nvim'

  -- Autocompletion
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-cmdline" }
  use { "hrsh7th/cmp-vsnip" }
  use { "hrsh7th/vim-vsnip" }
  use { "onsails/lspkind-nvim" }

  -- Formatting, linting
  use { "jose-elias-alvarez/null-ls.nvim" }

  -- Treesitter: Syntax highlighting
  use { "windwp/nvim-ts-autotag" }
  use { "windwp/nvim-autopairs" }
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { 'b3nj5m1n/kommentary' } -- Comment blocks of code

  -- File explorer
  use "kyazdani42/nvim-web-devicons"
  use { "kyazdani42/nvim-tree.lua" }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }

  use { "stevearc/aerial.nvim" }

  use {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
  }

  use { "mg979/vim-visual-multi" } -- Multi cursor
  use { 'norcalli/nvim-colorizer.lua' } -- color highlighter
  use { 'tpope/vim-fugitive' } -- Git plugins
  use { 'airblade/vim-gitgutter' }
  use { 'MunifTanjim/prettier.nvim' }

  use { 'rmagatti/goto-preview' }
  use { 'akinsho/flutter-tools.nvim' }
  -- npm install -g @fsouza/prettierd
  -- npm install -g prettier
end)
