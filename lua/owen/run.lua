function FindCargoToml(filePath)
    local home = os.getenv("HOME")
    local function search(path)
        local cargoFile = path .. '/Cargo.toml'
        -- os.execute returns 0 if the command is successful
        if os.execute('[ -f ' .. cargoFile .. ' ]') == 0 then
            return cargoFile
        else
            local parent = path:match("(.+)/[^/]*$")
            if parent and parent ~= home then
                return search(parent)
            end
        end
        return nil
    end

    return search(filePath)
end

vim.api.nvim_create_user_command("RunF", function ()
    local filename = vim.api.nvim_buf_get_name(0)
    if filename == "" then
        vim.notify("No file in buffer")
    end

    local extension = filename:match("^.+%.(.+)$")
    if not extension then
        vim.notify("No readable extension")
    end

    vim.api.nvim_command("w")

    if extension == "py" then
        vim.api.nvim_command("!python3 " .. filename)
   
    elseif extension == "c" or extension == "cpp"  then
        local time = os.time()
        vim.api.nvim_command("!gcc " .. filename .. " -o _nvim_RunF_".. time ..".out")
        vim.api.nvim_command("!./_nvim_RunF_" .. time .. ".out")
        vim.api.nvim_command("!rm _nvim_RunF_" .. time .. ".out")
    elseif extension == "rs" or filename == "Cargo.lock" or filename == "Cargo.toml" then
        local toml = FindCargoToml(filename)
        if toml then
            vim.api.nvim_command("!cargo run --manifest-path " .. toml)
        else
            vim.api.nvim_command("!cargo run")
        end

    elseif extension == "hs" then
        vim.api.nvim_command("!runghc " .. filename)
    elseif extension == "js" then
        vim.api.nvim_command("!node " .. filename)
    else
        vim.notify("Could not run extension ." .. extension)
    end

end, {})
