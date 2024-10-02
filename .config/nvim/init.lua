vim.opt.termguicolors = true
require'colorizer'.setup()
-- require("kanagawa").setup({
--   colors = {
--     palette = {
--       sumiink4 = '#000000'
--     }
--   },
--   transparent = true,
-- })
--

require("gruvbox").setup({
  transparent_mode = true,
})

vim.cmd.colorscheme "gruvbox"
vim.cmd("highlight telescopeborder guibg=none")
vim.cmd("highlight pmenu guibg=#0a0a0a")

vim.g.copilot_no_tab_map = true

require("autoclose").setup()
require("otavio.remap")
require("otavio.set")
require("oil").setup({
  view_options = {
    show_hidden = true,
  }
})
require('nvim-ts-autotag').setup()

