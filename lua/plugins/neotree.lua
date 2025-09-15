return {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            window = {
                position = "right"
            },
            event_handlers = {
                {
                    event = "file_opened",
                    handler = function(_)
                        require("neo-tree.command").execute({ action = "close" })
                    end
                },

            }
        })

        vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')
    end
}
