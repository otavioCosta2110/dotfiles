vim.opt.termguicolors = true
require'colorizer'.setup()

vim.cmd.colorscheme "gruvbox"

require("flutter-tools").setup {} -- use defaults

vim.g.copilot_no_tab_map = true

require("autoclose").setup()
require("otavio.remap")
require("otavio.set")
