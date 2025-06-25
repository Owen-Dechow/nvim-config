local function check_git_status(git_path)
    local function run_git_command(cmd)
        local f = io.popen(cmd)
        if not f then return "" end
        local result = f:read("*a")
        f:close()
        return result
    end

    local result_flags = {}

    -- Check for local unsaved changes
    local status = run_git_command('git -C "' .. git_path .. '" status --porcelain')
    if status ~= "" then
        table.insert(result_flags, "Unsaved Local Changes")
    end

    -- Check for unpushed commits
    local unpushed = run_git_command('git -C "' .. git_path .. '" log --branches --not --remotes')
    if unpushed ~= "" then
        table.insert(result_flags, "Unpushed Commits")
    end

    -- Fetch remote and check for new commits
    run_git_command('git -C "' .. git_path .. '" fetch')
    local remote = run_git_command('git -C "' .. git_path .. '" log --remotes --not --branches')
    if remote ~= "" then
        table.insert(result_flags, "Remote Changes")
    end

    return result_flags
end

vim.defer_fn(function()
    local status = check_git_status(vim.fn.stdpath("config"))
    if #status == 0 then
            vim.notify("Neovim config synchronized ✓")
    else
        for _, alert in pairs(status) do
            vim.notify("Neovim config is not synchronized: " .. alert, "warn")
        end
    end
end, 10)
