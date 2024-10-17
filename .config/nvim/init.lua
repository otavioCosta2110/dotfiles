vim.opt.termguicolors = true
require("otavio.lazy_init")
require("otavio.remap")
require("otavio.set")

local function check_time()
  return os.date("*t").hour
end

local fg_saturation = 10
if check_time() <= 18 then
  fg_saturation = 15;
else
  fg_saturation = 10;
end

require("posterpole").setup({
  colorless_bg = true,
  transparent = true,
    fg_saturation = fg_saturation,
})
vim.cmd.colorscheme "posterpole"

vim.cmd("highlight TelescopeBorder guibg=none")
vim.cmd("highlight TelescopePromptBorder guibg=none")
vim.cmd("highlight TelescopePreviewBorder guibg=none")
vim.cmd("highlight telescopeborder guibg=none")
vim.cmd("highlight pmenu guibg=#0a0a0a")

vim.g.copilot_no_tab_map = true

require("autoclose").setup()

require("oil").setup({
  view_options = {
    show_hidden = true,
  }
})

require('nvim-ts-autotag').setup()


