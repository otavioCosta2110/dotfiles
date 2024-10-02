vim.g.mapleader = " "
local vks = vim.keymap.set

local harpoon = require("harpoon")
harpoon:setup({})

-- Harpoon
vks("n", "<tab>", function() harpoon:list():next({ ui_nav_wrap = true }) end);
vks("n", "<S-tab>", function() harpoon:list():prev({ ui_nav_wrap = true }) end);
vks("n", "<leader>a", function() harpoon:list():add() end)
vks("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vks("n", "<A-1>", function() harpoon:list():select(1) end);
vks("n", "<A-2>", function() harpoon:list():select(2)end)
vks("n", "<A-3>", function() harpoon:list():select(3)end)
vks("n", "<A-4>", function() harpoon:list():select(4)end)
vks("n", "<A-5>", function() harpoon:list():select(5)end)
vks("n", "<A-6>", function() harpoon:list():select(6)end)
vks("n", "<A-7>", function() harpoon:list():select(7)end)
vks("n", "<A-8>", function() harpoon:list():select(8)end)
vks("n", "<A-9>", function() harpoon:list():select(9)end)

vks("n", "<A-u>", function() harpoon:list():select(1) end);
vks("n", "<A-i>", function() harpoon:list():select(2)end)
vks("n", "<A-o>", function() harpoon:list():select(3)end)
vks("n", "<A-p>", function() harpoon:list():select(4)end)
vks("n", "<A-j>", function() harpoon:list():select(5) end);
vks("n", "<A-k>", function() harpoon:list():select(6)end)
vks("n", "<A-l>", function() harpoon:list():select(7)end)

