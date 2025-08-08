local rust_analyzer_toggle_inlay_hint = true;

return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry", -- Default registry
                    "github:nvim-java/mason-registry", -- Example: Java-specific registry
                }
            })
        end
    },
    {
        "Issafalcon/lsp-overloads.nvim",
        config = function()
            vim.keymap.set('n', '<leader>ol', '<Cmd>LspOverloadsSignature<CR>')
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "fortls",
                    "jsonls",
                    "basedpyright",
                    "oxlint",
                    "markdown_oxide",
                    "rust_analyzer",
                    "sourcery",
                    "taplo",
                    "clangd",
                    "jdtls",
                    "omnisharp",
                },
                automatic_enable = {
                    exclude = { "jdtls" }
                }
            })

            vim.lsp.config("basedpyright", {
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "off",
                        }
                    },
                },
            })

            vim.lsp.config("rust_analyzer", {
                on_attach = function()
                    if rust_analyzer_toggle_inlay_hint then
                        rust_analyzer_toggle_inlay_hint = false;
                        vim.lsp.inlay_hint.enable(true)
                        vim.notify(
                            "Rust Project Detected!"
                            .. "\nInlay hints are enabled after rust project is detected."
                            .. "\nTo disable, run `:ToggleInlayHints"
                        )
                    end
                end
            })

            vim.lsp.config("omnisharp", {
                on_attach = function(client)
                    require('lsp-overloads').setup(client, {
                        keymaps = {
                            next_signature = "<C-j>",
                            previous_signature = "<C-k>",
                            close_signature = "<Esc>",
                        },
                        display_automatically = false,
                    })
                end
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
    },
    { "nvimtools/none-ls.nvim" },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "black",
                    "djlint",
                    "findent",
                    "cbfmt",
                },
            })
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.findent,
                    null_ls.builtins.formatting.cbfmt,
                    null_ls.builtins.formatting.djlint,
                },
            })
        end
    },
}
