return {
    {
        "tiagovla/tokyodark.nvim",
        config = function()
            local background = "#0a0a0a"

            -- Set colorscheme
            vim.cmd("colorscheme tokyodark")


            -- Highlight groups
            local hl = vim.api.nvim_set_hl
            hl(0, "Normal", { bg = background })
            hl(0, "NonText", { bg = background })
            hl(0, "EndOfBuffer", { bg = background })
            hl(0, "NormalFloat", { bg = background })
            hl(0, "SignColumn", { bg = background })
            hl(0, "CursorLine", { bg = "#152010" })
            hl(0, "NormalNC", { bg = background })
            hl(0, "TabLineFill", { bg = background })
            hl(0, "TabLineSel", { bg = "#304020", fg = background })
            hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "Red" })
            hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "Yellow" })
            hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = "Blue" })
            hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "Green" })
            hl(0, "CursorLineNr", { fg = "#608040", bold = true })
            hl(0, "LspInlayHint", { fg = "#505050", bold = true })
            hl(0, "ColorColumn", { bg = "#0f0f0f" })
            hl(0, "@structure", { fg = "#caca66", italic = true })

            -- Options
            vim.opt.cursorline = true
            vim.opt.colorcolumn = "80"
        end
    },
}
