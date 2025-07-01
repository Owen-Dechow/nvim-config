return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({})
            -- require("mason-registry").refresh(function()
            --     for _, name in ipairs(install) do
            --         local p = require("mason-registry").get_package(name)
            --         if p and not p:is_installed() then
            --             p:install()
            --         end
            --     end
            -- end)
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup(
                {
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
