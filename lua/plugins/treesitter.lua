return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = { enabled = true },
                indent = { enabled = true }
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
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
                    "while",
                    "switch",
                    "case",
                },
            },
            mode = "cursor",
            separator = "─",
        },
    }
}
