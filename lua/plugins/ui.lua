return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
    {
        "Fildo7525/pretty_hover",
        event = "LspAttach",
        opts = {}
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                stages = "static",
                top_down = false,
                render = "wrapped-compact",
            })
            vim.notify = require("notify")
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    }
}
