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
        "rcarriga/nvim-notify",
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
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup({
                options = {
                    globalstatus = true,
                }
            })
        end
    },
    { "lewis6991/gitsigns.nvim" },
    {
        "hedyhli/outline.nvim",
        config = function()
            -- Example mapping to toggle outline
            vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
                { desc = "Toggle Outline" })

            require("outline").setup {
                -- Your setup opts here (leave empty to use defaults)
            }
        end,
    },
    {
        'nacro90/numb.nvim',
        config = function()
            require('numb').setup()
        end,
    }
}
