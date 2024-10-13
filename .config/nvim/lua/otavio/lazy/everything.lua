return {

  {
    "ilof2/posterpole.nvim",
    lazy = false,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
  },
  {
    "norcalli/nvim-colorizer.lua"
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  { 'mbbill/undotree' },

  { 'tpope/vim-fugitive' },

  { 'nvim-tree/nvim-web-devicons' },

  {
    'NvChad/nvterm',
    config = function()
      require("nvterm").setup()
    end
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = false,
    priority = 1000
  },

  { "hrsh7th/nvim-cmp" },

  { 'hrsh7th/cmp-buffer' },

  { "hrsh7th/vim-vsnip" },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  },

  { "m4xshen/autoclose.nvim" },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  { "github/copilot.vim" },

  { "lewis6991/gitsigns.nvim" },

  { "tpope/vim-surround" },

  { "mg979/vim-visual-multi" },

  { "airblade/vim-gitgutter" },

  { 
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    priority = 1000
  },

  { "stevearc/oil.nvim" },

  { "windwp/nvim-ts-autotag" },

  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }

}
