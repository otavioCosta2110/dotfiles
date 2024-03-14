local telescope = require('telescope.builtin')
local telescopeProj = require'telescope'.load_extension('project')
vim.g.mapleader = " "
local vks = vim.keymap.set
-- general 
-- navigate within insert mode
vks("i", "<C-h>", "<Left>")
vks("i", "<C-l>", "<Right>")
vks("i", "<C-k>", "<Up>")
vks("i", "<C-j>", "<Down>")

vks("n", "<C-h>", "<C-w>h")
vks("n", "<C-l>", "<C-w>l")
vks("n", "<C-k>", "<C-w>k")
vks("n", "<C-j>", "<C-w>j")

--select all
vks("n", "<C-a>", "gg<S-v>G")
-- save file
vks("n", "<C-s>", ":w<cr>")

-- buffers
vks("n", "<leader>n", vim.cmd.enew)
vks("n", "<leader>v", vim.cmd.vsp)

local function get_buffer_name()
  return vim.api.nvim_buf_get_name(0)
end

-- nvim tree
-- vks("n", "<C-e>", vim.cmd.NvimTreeToggle);
vks("n", "<leader>e", vim.cmd.NvimTreeToggle);

-- Telescope
vks("n", "<leader>ff", telescope.find_files, {})
vks("n", "<leader>fw", telescope.live_grep, {})
vks("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
vks("n", "<leader>b", telescope.buffers, {})
vks("n", "<leader>fp",":lua require'telescope'.extensions.project.project{}<CR>", {})
vks("n", "<leader>fh", telescope.help_tags, {})
vks("n", "<C-c>", "<cmd>noh<CR>")
vks("n", "<Esc>", "<cmd>noh<CR>")

-- Bufferline
vks("n", "<tab>", '<cmd>lua require("harpoon.ui").nav_next()  <CR>');
vks("n", "<S-tab>", '<cmd>lua require("harpoon.ui").nav_prev()<CR>');

-- Harpoon
vks ("n", "<leader>a", '<cmd>lua require("harpoon.mark").add_file()<CR>')
vks ("n", "<leader>m", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')
vks ("n", "<leader>1", '<cmd>lua require("harpoon.ui").nav_file(1) <CR>')
vks ("n", "<leader>2", '<cmd>lua require("harpoon.ui").nav_file(2) <CR>')
vks ("n", "<leader>3", '<cmd>lua require("harpoon.ui").nav_file(3) <CR>')
vks ("n", "<leader>4", '<cmd>lua require("harpoon.ui").nav_file(4) <CR>')
vks ("n", "<leader>5", '<cmd>lua require("harpoon.ui").nav_file(5) <CR>')
vks ("n", "<leader>6", '<cmd>lua require("harpoon.ui").nav_file(6) <CR>')
vks ("n", "<leader>7", '<cmd>lua require("harpoon.ui").nav_file(7) <CR>')
vks ("n", "<leader>8", '<cmd>lua require("harpoon.ui").nav_file(8) <CR>')
vks ("n", "<leader>9", '<cmd>lua require("harpoon.ui").nav_file(9) <CR>')

-- NvTerm
vks("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true) )
vks("n", "<A-h>", function()
	require('nvterm.terminal').toggle "horizontal"
end);
vks("t", "<A-h>", function()
	require('nvterm.terminal').toggle "horizontal"
end);
vks("n", "<A-v>", function()
	require('nvterm.terminal').toggle "vertical"
end);
vks("t", "<A-v>", function()
	require('nvterm.terminal').toggle "vertical"
end);
vks("n", "<leader>t", "<cmd>term <CR>")

-- visual change lines
vks("v", "J", ":m '>+1<CR>gv=gv")
vks("v", "K", ":m '>-2<CR>gv=gv")

-- copy to sys clipboard
vks("n", "<leader>y", "\"+y")
vks("v", "<leader>y", "\"+y")

-- %s
vks("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make buffer executable
vks("n", "<leader>X", "<cmd>!chmod +x %<CR>", {silent = true})

-- close current buffer
vks("n", "<leader>x", "<cmd>:bd %<CR>")

vks("i", "<C-c>", "<Esc>")

--comment
vks("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end);
vks("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>");

--copilot
vim.keymap.set('i', '<C-i>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

vim.g.copilot_no_tab_map = true
