pcall(vim.cmd, "GitBlameDisable")

vim.keymap.set("n", "<leader>gb", function()
    pcall(vim.cmd, "GitBlameToggle")
end)
