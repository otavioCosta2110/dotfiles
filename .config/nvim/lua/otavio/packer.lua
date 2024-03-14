vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',

		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use 'mbbill/undotree'
	use('tpope/vim-fugitive')
	use('nvim-tree/nvim-tree.lua')
	use('nvim-tree/nvim-web-devicons')
 	use{'NvChad/nvterm',config = function () require("nvterm").setup() end,}
	-- use{"neovim/nvim-lspconfig"}
	use{"LuaLS/lua-language-server"}
	use{"typescript-language-server/typescript-language-server"}
	use "nvim-lua/plenary.nvim"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/vim-vsnip"
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
	use { "catppuccin/nvim", as = "catppuccin" }
    -- use "tmsvg/pear-tree"
    use "m4xshen/autoclose.nvim"
    use "ThePrimeagen/harpoon"
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'sudormrfbin/cheatsheet.nvim',

        requires = {
            {'nvim-telescope/telescope.nvim'},
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
        }
    }
    -- use {"vim-airline/vim-airline"}
    -- use "vim-airline/vim-airline-themes"
    use "github/copilot.vim"
    use "lewis6991/gitsigns.nvim"
    use {'edluffy/hologram.nvim'}
    use "itchyny/lightline.vim"
    use "tpope/vim-surround"
    use "mg979/vim-visual-multi"
    use "airblade/vim-gitgutter"
    use "nvim-telescope/telescope-project.nvim"
    use "morhetz/gruvbox"
    use "norcalli/nvim-colorizer.lua"
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
end)
