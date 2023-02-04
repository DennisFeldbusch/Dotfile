-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
    
  use 'github/copilot.vim'

  use 'sudar/comments.vim'
  use 'gko/vim-coloresque'
  use 'ThePrimeagen/harpoon'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'morhetz/gruvbox'
  use 'preservim/nerdtree'
  use 'vwxyutarooo/nerdtree-devicons-syntax'
  use 'ryanoasis/vim-devicons'
  use 'bling/vim-airline'
  use 'puremourning/vimspector'
  use {'KeitaNakamura/tex-conceal.vim', ft = 'tex'}
  use 'sirver/ultisnips'
  use 'honza/vim-snippets'
  use {'lervag/vimtex',  ft = 'tex' }
  use 'tpope/vim-fugitive'
  use 'voldikss/vim-floaterm'



  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }
  use {'nvim-treesitter/nvim-treesitter-textobjects'}


  --
  use {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/cmp-omni'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}

end)


