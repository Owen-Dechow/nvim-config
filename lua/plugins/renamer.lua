vim.pack.add({
    'https://github.com/filipdutescu/renamer.nvim',
    'https://github.com/nvim-lua/plenary.nvim'
})

require("renamer").setup({
    min_width = 20,
})

vim.keymap.set('n', '<leader>rr', require("renamer").rename, { desc = "Rename" })
