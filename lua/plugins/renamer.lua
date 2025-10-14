return {
    'filipdutescu/renamer.nvim',
    event = "VeryLazy",
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require("renamer").setup({
            min_width = 20,
        })
        vim.keymap.set('n', '<leader>rr', require("renamer").rename)
    end
}
