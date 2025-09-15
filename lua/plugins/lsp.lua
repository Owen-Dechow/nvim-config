return {
    -- Mason core
    {
        "mason-org/mason.nvim",
        lazy = true,
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
        lazy = true,
        dependencies = {
            "neovim/nvim-lspconfig",
            "mason-org/mason.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")

            local lsps = {
                "lua_ls",
                "fortls",
                "clangd",
                "html",
                "jsonls",
                "basedpyright",
                "oxlint",
                "markdown_oxide",
                "rust_analyzer",
                "taplo",
                "jdtls",
                "emmet_language_server",
                "ruff",
            }


            lspconfig.basedpyright.setup({
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "basic",
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
            require("mason-lspconfig").setup({
                ensure_installed = lsps,
                automatic_installation = true,
            })
        end,
    },

    -- TS tools
    {
        "pmizio/typescript-tools.nvim",
        lazy = true,
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {
            settings = {
                tsserver_format_options = {
                    semicolons = 'insert'
                }
            }
        },
    },

    -- Core LSPConfig
    {
        "neovim/nvim-lspconfig",
        lazy = true,
    },

    -- Null-ls for formatters
    {
        "nvimtools/none-ls.nvim",
        lazy = true,
    },
}
