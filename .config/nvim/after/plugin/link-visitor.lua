local lv = require("link-visitor")

vim.keymap.set("n", "<leader>l", function() lv.link_under_cursor() end)
vim.keymap.set("n", "<C-LeftMouse>", function() lv.link_under_cursor() end)
