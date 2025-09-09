return {
    -- Mason core
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:nvim-java/mason-registry",
                    "github:crashdummyy/mason-registry",
                },
            })

            local registry = require("mason-registry")
            local ensure_installed = { "roslyn" }

            for _, pkg_name in ipairs(ensure_installed) do
                local ok, pkg = pcall(registry.get_package, pkg_name)
                if ok and not pkg:is_installed() then
                    pkg:install()
                end
            end
        end,
    },

    -- Mason-LSPConfig bridge
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            local lspconfig = require("lspconfig")

            local custom_setup = {}

            function C(server)
                custom_setup[server] = true
            end

            local lsps = {
                "lua_ls",
                "fortls",
                "clangd",
                "html",
                "jsonls",
                C "basedpyright",
                "oxlint",
                "markdown_oxide",
                C "rust_analyzer",
                "taplo",
                C "jdtls",
                "emmet_language_server",
                "ruff",
            }

            require("mason-lspconfig").setup({
                ensure_installed = lsps,
                automatic_installation = true,
            })

            lspconfig.basedpyright.setup({
                settings = {
                    basedpyright = {
                        analysis = {
                            typecheckingmode = "off",
                        },
                    },
                },
            })

            local rust_analyzer_toggle_inlay_hint = true
            lspconfig.rust_analyzer.setup({
                on_attach = function(_)
                    if rust_analyzer_toggle_inlay_hint then
                        rust_analyzer_toggle_inlay_hint = false
                        vim.lsp.inlay_hint.enable(true)
                        vim.notify(
                            "Rust project detected!\nInlay hints enabled.\nRun `:ToggleInlayHints` to disable."
                        )
                    end
                end,
            })

            for _, lsp in ipairs(lsps) do
                if not custom_setup[lsp] then
                    lspconfig[lsp].setup({})
                end
            end
        end,
    },

    -- TS tools
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },

    -- Core LSPConfig
    { "neovim/nvim-lspconfig" },

    -- Null-ls for formatters
    { "nvimtools/none-ls.nvim" },
}
