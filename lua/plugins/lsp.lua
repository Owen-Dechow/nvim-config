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
            local ensure_installed = {
                "roslyn",
                "lua-language-server",
                "fortls",
                "clangd",
                "html-lsp",
                "json-lsp",
                "basedpyright",
                "oxlint",
                "markdown-oxide",
                "rust-analyzer",
                "taplo",
                "jdtls",
                "emmet-language-server",
                "ruff",
                "omnisharp",
                "css-lsp",
                "djlint",
            }

            for _, pkg_name in ipairs(ensure_installed) do
                local ok, pkg = pcall(registry.get_package, pkg_name)
                if ok and not pkg:is_installed() then
                    pkg:install()
                elseif not ok then
                    vim.notify("Error on Mason registry " .. pkg_name)
                end
            end
        end,
    },

    -- Mason-LSPConfig bridge
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mason-org/mason.nvim",
        },
        config = function()
            vim.lsp.config("basedpyright", {
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "basic",
                            reportUnannotatedClassAttribute = false,
                        },
                    },
                },
            })

            vim.lsp.config("omnisharp", {
                enable_import_completion = true,
                organize_imports_on_format = true,
                enable_roslyn_analyzers = true,
            })

            require("mason-lspconfig").setup({
                automatic_enable = {
                    exclude = {
                        "rust_analyzer",
                        -- "omnisharp",
                    }
                }
            })
        end,
    },

    -- TS tools
    {
        "pmizio/typescript-tools.nvim",
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
    },


    {
        'mrcjkb/rustaceanvim',
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

    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        event = "VeryLazy",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.djlint.with({
                        extra_args = { "--profile=django",
                            "--max-blank-lines", "1",
                            "--blank-line-after-tag", "extends",
                            "--format-attribute-template-tags",
                            "--format-css", "--format-js",
                            "--max-line-length", "120",
                            "--quiet",
                        }
                    }),
                },
            })
        end
    }
}
