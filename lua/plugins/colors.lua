vim.pack.add({
    "https://github.com/olimorris/onedarkpro.nvim"
})

local color = require("onedarkpro.helpers")

require("onedarkpro").setup({
    colors = {
        bg = color.darken("bg", 10),
        cursorline = color.darken("bg", 5),
        selection = "#203040",
        darkorange = color.darken("orange", 50),
        colorline = color.darken("bg", 12),
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
        Folded = { fg = "${orange}", bg = "${darkorange}" },
        ColorColumn = {bg = "${colorline}"},
    },
    options = {
        cursorline = true,
    }
})

vim.cmd [[colorscheme onedark]]

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cobol",
    callback = function()
        vim.opt_local.colorcolumn = "7,12,73,80"
    end,
})
