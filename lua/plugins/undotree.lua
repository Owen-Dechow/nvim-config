vim.pack.add({
    "https://github.com/mbbill/undotree",
})

vim.g.undotree_DiffCommand = "git diff"
vim.g.undotree_WindowLayout = 3
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
