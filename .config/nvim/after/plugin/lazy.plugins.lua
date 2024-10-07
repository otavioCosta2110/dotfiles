require('lazy').setup({

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  -- UndoTree
  { 'mbbill/undotree' },

  -- Fugitive
  { 'tpope/vim-fugitive' },

  -- Icons
  { 'nvim-tree/nvim-web-devicons' },

  -- Nvterm
  {
    'NvChad/nvterm',
    config = function()
      require("nvterm").setup()
    end
  },

  -- Lua Language Server
  { "LuaLS/lua-language-server" },

  -- Plenary (ensure it's loaded early since many plugins depend on it)
  { "nvim-lua/plenary.nvim" },

  -- Nvim-cmp
  { "hrsh7th/nvim-cmp" },

  -- Buffer source for nvim-cmp
  { 'hrsh7th/cmp-buffer' },

  -- Vsnip
  { "hrsh7th/vim-vsnip" },

  -- LSP Zero
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

  -- Autoclose
  { "m4xshen/autoclose.nvim" },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Comment.nvim
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

  -- Copilot
  { "github/copilot.vim" },

  -- Git signs
  { "lewis6991/gitsigns.nvim" },

  -- Vim Surround
  { "tpope/vim-surround" },

  -- Vim Visual Multi
  { "mg979/vim-visual-multi" },

  -- Git Gutter
  { "airblade/vim-gitgutter" },

  -- Oil.nvim
  { "stevearc/oil.nvim" },

  -- nvim-ts-autotag
  { "windwp/nvim-ts-autotag" },

  -- Posterpole.nvim
  { "ilof2/posterpole.nvim" }
})
