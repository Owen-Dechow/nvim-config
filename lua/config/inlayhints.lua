local autocmd = "ToggleInlayHints"
vim.api.nvim_create_user_command(autocmd, function()
    local value = not vim.lsp.inlay_hint.is_enabled()
    vim.lsp.inlay_hint.enable(value)

    if value then
        vim.notify("Inlay hints are on")
    else
        vim.notify("Inlay hints are off")
    end
end, {})


local toggled = false
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.rs",
    callback = function()
        if not toggled then
            vim.defer_fn(function() vim.lsp.inlay_hint.enable(true) end, 500)
            toggled = true
            vim.notify(
                "Rust Project Detected!"
                .. "\nInlay hints are enabled after rust project is detected."
                .. "\nTo disable, run `:" .. autocmd .. "`."
            )
        end
    end
})
