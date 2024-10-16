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
vks("n", "<C-A-a>", "gg<S-v>G")

-- save file
vks("n", "<C-s>", ":w<cr>")

-- buffers
vks("n", "<leader>v", vim.cmd.vsp)

-- nvim tree
vks("n", "<leader>e", vim.cmd.Oil);

-- Telescope
vks("n", "<leader>ff", telescope.find_files, {})
vks("n", "<leader>fw", telescope.live_grep, {})
vks("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
vks("n", "<leader>b", telescope.buffers, {})
vks("n", "<leader>fh", telescope.help_tags, {})

vks("n", "<C-c>", "<cmd>noh<CR>")
vks("n", "<Esc>", "<cmd>noh<CR>")
vks("i", "<C-c>", "<Esc>")
vks("n", "<C-c>", "<Esc>")

vks("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true) )

vks("n", "<leader>t", "<cmd>term <CR>")

-- visual change lines
vks("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- copy to sys clipboard
vks("n", "<leader>y", "\"+y")
vks("v", "<leader>y", "\"+y")

-- make buffer executable
vks("n", "<leader>X", "<cmd>!chmod +x %<CR>", {silent = true})

vks("i", "<C-c>", "<Esc>")

--comment
vks("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end);

vks("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>");

--copilot
vim.keymap.set('i', '<C-[>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
-- vim.g.copilot_no_tab_map = true
