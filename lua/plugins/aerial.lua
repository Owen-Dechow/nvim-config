return {
    'stevearc/aerial.nvim',
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    cmd = "AerialToggle",
    keys = "<leader>a",
    config = function()
        require("aerial").setup({
            layout = {
                width = .25
            }
        })
        vim.keymap.set("n", "<leader>a", "<CMD>AerialToggle<CR>")
    end
}
