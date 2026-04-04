-- Install plugin
vim.pack.add({
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context"
})

local file_types = {
    "c",
    "cpp",
    "c_sharp",
    "lua",
    "fortran",
    "html",
    "json",
    "python",
    "javascript",
    "typescript",
    "markdown",
    "markdown_inline",
    "rust",
    "toml",
    "java",
    "css",
}

-- Install parsers
require("nvim-treesitter").install(file_types)

-- Enable highlighting
vim.api.nvim_create_autocmd("FileType", {
    pattern = file_types,
    callback = function()
        vim.treesitter.start()
    end,
})

-- Enable indentation
vim.api.nvim_create_autocmd("FileType", {
    pattern = file_types,
    callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

-- Treesitter Context
require("treesitter-context").setup({
    enable = true,
    max_lines = 3,
    trim_scope = "outer",
    patterns = {
        default = {
            "class",
            "function",
            "method",
            "for",
            "if",
            "else",
            "while",
            "switch",
            "case",
        },
    },
    mode = "cursor",
    separator = "─",
})
