return {
    "nvimdev/lspsaga.nvim",
    -- load only when any LSP server attaches
    event = "LspAttach",
    dependencies = {
        "nvim-tree/nvim-web-devicons",     -- optional icons
        "nvim-treesitter/nvim-treesitter", -- for enhanced docs
    },
    config = function()
        require('lspsaga').setup({
            lightbulb = {
                enable = false, -- Keep this true if you still want the prompt when invoking code actions
                sign = true,    -- Set this to false to disable the lightbulb sign
            },
            beacon = {
                enable = false
            },
            diagnostic = {
                show_code_action = false,
                jump_num_shortcut = false,
            },
            ui = {
                markdown = { disable = true }
            }
        })
        -- LSP
        vim.keymap.set("n", "<leader>H", "<CMD>Lspsaga hover_doc<CR>")
        vim.keymap.set("n", "<leader>h", function()
            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            local diagnostics = vim.diagnostic.get(0, { lnum = cursor_pos[1] - 1 })

            if #diagnostics > 0 then
                vim.cmd("Lspsaga show_line_diagnostics")
            else
                vim.cmd("Lspsaga hover_doc")
            end
        end)

        vim.keymap.set("n", "<leader>ca", "<CMD>Lspsaga code_action<CR>")
        vim.keymap.set("n", "<leader>gd", "<CMD>Lspsaga goto_definition<CR>")
        vim.keymap.set('n', '<leader>rr', "<CMD>Lspsaga rename<CR>")
        vim.keymap.set("n", "<leader>nd", "<CMD>Lspsaga diagnostic_jump_next<CR>")

        vim.api.nvim_create_user_command("Term", function() vim.cmd("Lspsaga term_toggle") end, {})
    end,
}
