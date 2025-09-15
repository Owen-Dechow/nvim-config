return {
    'filipdutescu/renamer.nvim',
    event = "LspAttach",
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require("renamer").setup()
        vim.keymap.set('n', '<leader>rr', require("renamer").rename)
    end
}
