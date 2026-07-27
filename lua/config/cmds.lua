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

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local args = vim.fn.argv()
        if #args == 1 then
            local arg = args[1]
            local split = vim.split(arg, "\\.")

            if (#split == 2 or #split == 1) and split[1] == "sss" then
                vim.defer_fn(function()
                    if vim.fn.filereadable(arg) == 0 then
                        vim.bo.buftype = "nofile"
                        vim.bo.bufhidden = "hide"
                        vim.bo.swapfile = false
                        vim.bo.modifiable = true
                        vim.bo.readonly = false

                        vim.api.nvim_buf_set_name(0, "sss scratch")

                        if split[2] then
                            vim.bo.filetype = split[2]
                        end

                        vim.notify("Opened scratch buffer: " .. arg)
                    else
                        vim.notify(arg .. " is a real file. No scratch buffer opened.",
                            "WARN")
                    end
                end, 0)
            end
        end
    end,
})
