return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({})
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
                        lspconfig[server].setup({ capabilities = capabilities })
                    end
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
    },
}
