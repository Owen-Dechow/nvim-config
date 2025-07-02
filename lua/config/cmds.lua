vim.api.nvim_create_user_command("ToggleInlayHints", function()
    local value = not vim.lsp.inlay_hint.is_enabled()
    vim.lsp.inlay_hint.enable(value)

    if value then
        vim.notify("Inlay hints are on")
    else
        vim.notify("Inlay hints are off")
    end
end, {})

vim.api.nvim_create_user_command("W", function() vim.cmd("w") end, {})
vim.api.nvim_create_user_command("Wq", function() vim.cmd("wq") end, {})
vim.api.nvim_create_user_command("Q", function() vim.cmd("q") end, {})

vim.api.nvim_create_user_command("ToggleWrapping", function()
    vim.wo.wrap = not vim.wo.wrap
    if vim.wo.wrap then
        vim.notify("Line wrap on")
    else
        vim.notify("Line wrap off")
    end
end, {})
