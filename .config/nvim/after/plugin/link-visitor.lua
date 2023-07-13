local lv = require("link-visitor")

vim.keymap.set("n", "<leader>l", function() lv.link_under_cursor() end)
