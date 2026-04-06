vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/pmizio/typescript-tools.nvim",
    'https://github.com/mrcjkb/rustaceanvim',
    "https://github.com/jay-babu/mason-null-ls.nvim",
    "https://github.com/nvimtools/none-ls.nvim",
})

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
    "css-lsp",
    "djlint",
    "json-lsp",
}

for _, pkg_name in ipairs(ensure_installed) do
    local ok, pkg = pcall(registry.get_package, pkg_name)
    if ok and not pkg:is_installed() then
        pkg:install()
    elseif not ok then
        vim.notify("Error on Mason registry " .. pkg_name)
    end
end


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

require("mason-lspconfig").setup({
    automatic_enable = {
        exclude = {
            "rust_analyzer",
            "omnisharp",
        }
    }
})

require("typescript-tools").setup({
    settings = {
        tsserver_format_options = {
            semicolons = 'insert'
        }
    }
})

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
