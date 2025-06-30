-- MASON TOOLS TO BE INSTALLED
local install = {
    "djlint",
    "findent",
    "cbfmt",
    "basedpyright",
    "black",
    "lua-language-server",
    "fortls",
    "json-lsp",
    "markdown-oxide",
    "oxlint",
    "rust-analyzer",
    "sourcery",
}

return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({})
            require("mason-registry").refresh(function()
                for _, name in ipairs(install) do
                    local p = require("mason-registry").get_package(name)
                    if p and not p:is_installed() then
                        p:install()
                    end
                end
            end)
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup({
                handlers = {
                    function(server)
                        if server == "basedpyright" then
                            lspconfig.basedpyright.setup({
                                capabilities = capabilities,
                                settings = {
                                    python = {
                                        analysis = {
                                            typeCheckingMode = "off",         -- Disable type checking
                                            diagnosticMode = "openFilesOnly", -- Limit diagnostics
                                        }
                                    }
                                }
                            })
                        else
                            lspconfig[server].setup({ capabilities = capabilities })
                        end
                    end
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "nvimtools/none-ls.nvim",
        opts = function()
            local null_ls = require("null-ls")
            return {
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.findent,
                    null_ls.builtins.formatting.cbfmt,
                },
            }
        end,
    }
}
