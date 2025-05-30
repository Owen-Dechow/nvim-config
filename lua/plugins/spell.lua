return {
    --"Owen-Dechow/nvim_wurd_spel",
    dir = "C:\\Users\\owend\\Desktop\\nvim_wurd_spell",
    config = function()
        require("wurd_spel").setup({
            severity = vim.diagnostic.severity.INFO,
            -- -- Set the severity level of spelling errors
            -- -- INFO, WARN, ERROR

            -- min_length = 5,
            -- -- Set the minimum length of word to be checked

            -- ignore = { "Dechow", "Neovim" }
            -- -- Add words to be ignored
            -- -- IMPORTENT: words added to Neovim's built in
            --    spelling ignore dictionary are still ignored.`
            --    It is suggested to add words to that dictionary
            --    using `zg` or `:spellgood` instead of adding
            --    words here.
        })
    end
}
