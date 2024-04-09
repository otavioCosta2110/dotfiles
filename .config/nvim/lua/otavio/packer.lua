vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',

	 requires = { {'nvim-lua/plenary.nvim'} }
	}
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use 'mbbill/undotree'
	use('tpope/vim-fugitive')
	use('nvim-tree/nvim-tree.lua')
	use('nvim-tree/nvim-web-devicons')
 	use{'NvChad/nvterm',config = function () require("nvterm").setup() end,}
	use{"LuaLS/lua-language-server"}
	use{"typescript-language-server/typescript-language-server"}
	use "nvim-lua/plenary.nvim"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/vim-vsnip"
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
    use "m4xshen/autoclose.nvim"
    use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use "github/copilot.vim"
    use "lewis6991/gitsigns.nvim"
    use "tpope/vim-surround"
    use "mg979/vim-visual-multi"
    use "airblade/vim-gitgutter"
    use "nvim-telescope/telescope-project.nvim"
    use { "ellisonleao/gruvbox.nvim" }
    use "norcalli/nvim-colorizer.lua"
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
      'letieu/harpoon-lualine',
      opt = false,
      requires = {{'ThePrimeagen/harpoon'}}
    }
end)
