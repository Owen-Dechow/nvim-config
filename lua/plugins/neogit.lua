return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",  -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
        "echasnovski/mini.pick",         -- optional
        "folke/snacks.nvim",             -- optional
    },
    config = function()
        require("neogit").setup(
            {
                mappings = {
                    status = {
                        ["<CR>"] = "Toggle",
                        ["<cr>"] = "Toggle",
                        ["O"] = "Toggle",
                    },
                    popup = {
                        ["L"] = "LogPopup",
                        ["l"] = false,
                    }
                },
            })

        vim.keymap.set("n", "<leader>ng", "<CMD>Neogit<CR>")

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "DiffviewFiles",
            callback = function()
                vim.keymap.set("n", "q", function()
                    vim.cmd("DiffviewClose")
                end, { buffer = true })
            end,
        })
    end
}
