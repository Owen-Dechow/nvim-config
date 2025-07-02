---@diagnostic disable: undefined-global

return {
    {
        "tiagovla/tokyodark.nvim",
        config = function()
            local background = "#0a0a0a"
            vim.cmd("colorscheme tokyodark")
            vim.cmd("hi Normal guibg=" .. background)                        -- Dark gray background
            vim.cmd("hi NonText guibg=" .. background)                       -- Ensures empty areas match
            vim.cmd("hi EndOfBuffer guibg=" .. background)                   -- Covers the end of buffer
            vim.cmd("hi NormalFloat guibg=" .. background)                   -- Covers the end of buffer
            vim.cmd("hi SignColumn guibg=" .. background)                    -- Dark gray background for sign column
            vim.cmd("hi CursorLine guibg=#152010")                           -- Dark gray background for cursor line
            vim.cmd("hi NormalNC guibg=" .. background)                      -- Dark gray background for inactive

            vim.cmd("hi TabLineFill  guibg=" .. background)                   -- Dark gray background for inactive
            vim.cmd("hi TabLineSel guibg=#304020 guifg=" .. background)      -- Dark gray background for inactive

            vim.cmd("hi DiagnosticUnderlineError gui=undercurl guisp=Red")   -- Squiggly red underline for errors
            vim.cmd("hi DiagnosticUnderlineWarn gui=undercurl guisp=Yellow") -- Squiggly yellow underline for warnings
            vim.cmd("hi DiagnosticUnderlineInfo gui=undercurl guisp=Blue")   -- Squiggly blue underline for info
            vim.cmd("hi DiagnosticUnderlineHint gui=undercurl guisp=Green")  -- Squiggly green underline for hints

            vim.cmd("hi CursorLineNr guifg=#608040 gui=bold")                -- Cursor line color
            vim.cmd("set cursorline")                                        -- Enable Cursor line

            vim.o.colorcolumn = "80"                                         -- Highlights columns 72, 80, and 100
            vim.cmd("hi ColorColumn guibg=#0f0f0f")                          -- Dark gray background for color column
        end
    },
}
