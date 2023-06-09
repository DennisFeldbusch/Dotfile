-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --use 'github/copilot.vim'
    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                filetypes = { "python", "lua", "go", "rust", "c", "cpp", "javascript", "typescript", "html", "css", "markdown", "latex" },
            })
        end,
    }
    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function ()
            require("copilot_cmp").setup()
        end
    }

    -- telescope setup
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    --use 'ryanoasis/vim-devicons'

    -- latex support
    use {'KeitaNakamura/tex-conceal.vim', ft = 'tex'}
    use {'lervag/vimtex',  ft = 'tex' }

    -- lsp setup
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "WhoIsSethDaniel/mason-tool-installer.nvim" })

	-- auto completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
    use("onsails/lspkind-nvim")
    use("hrsh7th/cmp-nvim-lsp-signature-help")

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- treesitter
    use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
    use {'nvim-treesitter/nvim-treesitter-textobjects'}

    -- colorscheme
    use 'morhetz/gruvbox'

end)


