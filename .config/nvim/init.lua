vim.opt.termguicolors = true
require'colorizer'.setup()

vim.cmd.colorscheme "gruvbox"

vim.g.copilot_no_tab_map = true

require("autoclose").setup()
require("otavio.remap")
require("otavio.set")
