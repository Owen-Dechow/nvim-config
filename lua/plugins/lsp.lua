return {
    -- Mason core
    {
        "mason-org/mason.nvim",
        event = "VeryLazy",
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
        event = "VeryLazy",
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
                            reportUnannotatedClassAttribute = false
                        },
                    },
                },
            })

            require("mason-lspconfig").setup({
                ensure_installed = lsps,
                automatic_installation = true,
                automatic_enable = {
                    exclude = {
                        "rust_analyzer",
                    }
                }
            })
        end,
    },

    -- TS tools
    {
        "pmizio/typescript-tools.nvim",
        event = "VeryLazy",
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
        event = "VeryLazy",
    },


    {
        'mrcjkb/rustaceanvim',
        event = "VeryLazy",
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    settings = {
                        ['rust-analyzer'] = {
                            diagnostics = {
                                disabled = { "unnecessary_return" },
                            },
                        },
                    },
                },
            }
        end
    },

    -- Null-ls for formatters
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
    },
}
