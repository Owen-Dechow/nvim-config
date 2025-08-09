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
    { "Issafalcon/lsp-overloads.nvim", },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            local dont_auto_setup = {}
            local function L(lsp)
                dont_auto_setup[lsp] = true
                return lsp
            end

            local lsps = {
                "lua_ls",
                "fortls",
                L "jsonls",
                "basedpyright",
                L "oxlint",
                L "markdown_oxide",
                "rust_analyzer",
                L "taplo",
                "clangd",
                "jdtls",
                "omnisharp",
            }


            require("mason-lspconfig").setup({
                ensure_installed = lsps,
                automatic_enable = {
                    exclude = { "jdtls" }
                }
            })

            local function on_attach(client)
                require('lsp-overloads').setup(client, {
                    keymaps = {
                        next_signature = "<C-j>",
                        previous_signature = "<C-k>",
                        close_signature = "<Tab>",
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
            end

            vim.lsp.config(L "basedpyright", {
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "off",
                        }
                    },
                },
                on_attach = on_attach
            })

            vim.lsp.config(L "rust_analyzer", {
                on_attach = function(client)
                    if rust_analyzer_toggle_inlay_hint then
                        rust_analyzer_toggle_inlay_hint = false;
                        vim.lsp.inlay_hint.enable(true)
                        vim.notify(
                            "Rust Project Detected!"
                            .. "\nInlay hints are enabled after rust project is detected."
                            .. "\nTo disable, run `:ToggleInlayHints"
                        )
                    end
                    on_attach(client)
                end
            })

            for _, lsp in pairs(lsps) do
                if not dont_auto_setup[lsp] then
                    vim.lsp.config(lsp, {
                        on_attach = on_attach
                    });
                end
            end
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
