return {
    "Owen-Dechow/nvim_wurd_spel",
    -- dir = "C:\\Users\\owend\\Desktop\\nvim_wurd_spell",
    opts = {
        -- severity = vim.diagnostic.severity.INFO,
        -- -- Set the severity level of spelling errors:
        --     INFO, WARN, or ERROR.

        -- min_length = 5,
        -- -- Set the minimum length of word to be checked.

        -- ignore = { "Dechow", "Neovim" }
        -- -- Add words to be ignored.
        -- -- IMPORTENT: words added to Neovim's built in
        --     spelling ignore dictionary are still ignored.`
        --     It is suggested to add words to that dictionary
        --     using `zg`, `:spellgood`, or from the
        --     `:WurdSpel suggest` options instead of adding
        --     words here.

        -- enabled = true
        -- -- Enable WurdSpel on start.

        -- remap = true
        -- -- Remap the builtin z=, zg, & zw commands to the
        --     WurdSpel command equivalents:
        --     z= -> WurdSpel suggest
        --     zg -> WurdSpel good
        --     zw -> WurdSpel bad

        remap_special = true,
        -- -- Add special remaps:
        --     <leader>zz -> WurdSpel suggest
        --     <leader>zg -> WurdSpel good
        --     <leader>zw -> WurdSpel bad

        -- buf_option_guards = {
        --    modifiable = true,
        --    buftype = "",
        -- }
        -- -- These checks determine if the spellchecker will be
        --     attached to the buffer. The value will be gotten
        --     using `nvim_buf_get_option(0, ...)`.
        -- -- If the result of
        --     `nvim_buf_get_option` is not equal to the specified
        --     value in the table then the spellchecker will not
        --     attach.

        -- pattern = { "*" },
        -- -- Pattern for auto commands.

        -- allow_one_letter_prefix = true
        -- -- Allow one letter prefix on words:
        --     `ilocal` -> correct because local is correct.
        -- -- If this setting is false:
        --     `ilocal` -> incorrect because ilocal is not a word.

        -- num_options = 5,
        -- -- Set the maximum number of options in the spell
        --     suggest menu.

        -- add_to_settings_in_suggest = true,
        -- -- Add the `[Add to user settings]` option in the
        --     spell suggest menu.

        -- add_to_settings_at_end = true,
        -- -- Control the location of the `[Add to user settings]`
        --     option in the spell suggest menu.
        -- -- If this setting is true `[Add to user settings]` will
        --     be at the end.
        -- -- If this setting is false `[Add to user settings]` will
        --     be at the start.

        -- message_prefix = "(zz) "
        -- -- Adds a prefix to the "Possible misspelling ..." error
        --     message.
        -- -- You may use any string value for this option.
        -- -- Examples:
        --     "(zz) " ->  "(zz) Possible misspelling..."
        --     ""      ->  "Possible misspelling..."
    }
}
