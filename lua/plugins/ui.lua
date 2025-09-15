return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
        lazy = true,
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            require("telescope").load_extension("ui-select")

            vim.api.nvim_create_autocmd("BufWinEnter", {
                pattern = "quickfix",
                callback = function()
                    vim.schedule(function()
                        vim.cmd("cclose")
                        require('telescope.builtin').quickfix()
                    end)
                end,
            })

        end
    },
    {
        "Fildo7525/pretty_hover",
        event = "LspAttach",
    },
    {
        "rcarriga/nvim-notify",
        lazy = true,
        dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
        config = function()
            ---@param msg string
            ---@param level string | nil
            vim.notify = function(msg, level)
                require("notify").setup({
                    stages = "static",
                    top_down = false,
                    render = "wrapped-compact",
                })
                vim.notify = require("notify")
                vim.notify(msg, level)
            end
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = true,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                globalstatus = true,
            }
        },
    }
}
