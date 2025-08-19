return {
    "seblyng/roslyn.nvim",
    ft="cs",
    config = function()
        require("roslyn").setup()
        vim.lsp.config("roslyn", {
            on_attach = function(client)
                require('lsp-overloads').setup(client, {
                    keymaps = {
                        next_signature = "<C-j>",
                        previous_signature = "<C-k>",
                        close_signature = "<C-c>",
                    },
                    display_automatically = true,
                    silent = false,
                    ui = {
                        max_width = 60,
                        border = "rounded",
                        max_height = 5,
                        floating_window_above_cur_line = true,
                    }
                })
            end,
            settings = {
                ["csharp|inlay_hints"] = {
                    csharp_enable_inlay_hints_for_implicit_object_creation = true,
                    csharp_enable_inlay_hints_for_implicit_variable_types = true,
                },
                ["csharp|code_lens"] = {
                    dotnet_enable_references_code_lens = true,
                },
            },
        })
    end
}
