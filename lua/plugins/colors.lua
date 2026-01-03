return {
    {
        "olimorris/onedarkpro.nvim",
        config = function()
            local color = require("onedarkpro.helpers")

            require("onedarkpro").setup({
                colors = {
                    bg = color.darken("bg", 10),
                    cursorline = color.darken("bg", 5),
                    selection = color.lighten("bg", 1),
                    darkorange = color.darken("orange", 50),
                },
                highlights = {
                    ["@lsp.type.struct"] = { fg = "${green}" },
                    NormalFloat = { bg = "${bg}" },
                    FloatBorder = { bg = "${bg}" },
                    TelescopeNormal = { bg = "${bg}" },
                    TelescopeBorder = { bg = "${bg}" },
                    Search = { bg = "${blue}", fg = "${black}", },
                    CurSearch = { bg = "${cyan}", fg = "${black}", },
                    IncSearch = { bg = "${cyan}", fg = "${black}", },
                    MatchParen = { bg = "${selection}", fg = "${cyan}" },
                    Folded = { fg = "${orange}", bg = "${darkorange}" }
                },
                options = {
                    cursorline = true,
                }
            })

            vim.cmd [[colorscheme onedark]]
        end
    },
    {
        'brenoprata10/nvim-highlight-colors',
        config = true,
    },
}
