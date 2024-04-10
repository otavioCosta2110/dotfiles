local telescope = require('telescope.builtin')
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
vks("n", "<C-S-a>", "gg<S-v>G")
-- save file
vks("n", "<C-s>", ":w<cr>")

-- buffers
vks("n", "<leader>n", vim.cmd.enew)
vks("n", "<leader>v", vim.cmd.vsp)


-- nvim tree
vks("n", "<leader>e", vim.cmd.NvimTreeToggle);

-- Telescope
vks("n", "<leader>ff", telescope.find_files, {})
vks("n", "<leader>fw", telescope.live_grep, {})
vks("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
vks("n", "<leader>b", telescope.buffers, {})
vks("n", "<leader>fh", telescope.help_tags, {})
vks("n", "<C-c>", "<cmd>noh<CR>")
vks("i", "<C-c>", "<Esc>")
vks("n", "<C-c>", "<Esc>")
vks("n", "<Esc>", "<cmd>noh<CR>")

require('telescope').load_extension('prosession')
vks("n", "<leader>fp","<cmd>Telescope prosession<CR>", {})

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
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copy to sys clipboard
vks("n", "<leader>y", "\"+y")
vks("v", "<leader>y", "\"+y")

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
