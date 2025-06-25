local version = vim.version()
version = version.major .. "." .. version.minor .. "." .. version.patch

local function utf8len(str)
    local _, count = string.gsub(str, "[^\128-\191]", "")
    return count
end

local text = {
    "",
    "",
    "",
    "",
    "Neovim v" .. version,
    function()
        local path = vim.fn.getcwd()
        if utf8len(path) > 40 then
            return "..." .. string.sub(path, utf8len(path) - 37, utf8len(path) + 1)
        else
            return path
        end
    end,
    "",
    "╭──────────────────────────────────────────────╮",
    "│           1 Peter 3:15 (NASB 1995)           │",
    "│                                              │",
    "│ But sanctify Christ as Lord in your hearts,  │",
    "│ always being ready to make a defense to      │",
    "│ everyone who asks you to give an account for │",
    "│ the hope that is in you, yet with gentleness │",
    "│ and reverence;                               │",
    "╰──────────────────────────────────────────────╯",
    "╭────────────────┬─────────────────────────────╮",
    "│ :enew          │ • Open new buffer           │",
    "├────────────────┼─────────────────────────────┤",
    "│ <leader>e      │ • Open Neotree              │",
    "├────────────────┼─────────────────────────────┤",
    "│ :OpenStartMenu │ • Open this menu again      │",
    "╰────────────────┴─────────────────────────┬───┤",
    " Owen Dechow's Neovim Config               │ ✞ │",
    "                                           ╰───╯",
    "",
    "",
}


local function render_start_screen()
    local new_text = {}

    local bufn = vim.api.nvim_create_buf(false, false)
    vim.api.nvim_set_current_buf(bufn)
    vim.b.name = "StartMenu"

    local w_width = vim.api.nvim_win_get_width(0)

    for key, line in pairs(text) do
        if type(line) == "function" then
            line = line()
        end

        local t_width = utf8len(line)
        if t_width < w_width then
            local add = math.floor((w_width - t_width) / 2)
            if line ~= "" then
                new_text[key] = string.rep(" ", add) .. line
            else
                new_text[key] = ""
            end
        else
            new_text[key] = line
        end
    end

    vim.api.nvim_buf_set_text(bufn, 0, 0, 0, 0, new_text)
    vim.api.nvim_buf_set_option(bufn, "modifiable", false)
    vim.api.nvim_buf_set_option(bufn, 'buflisted', false)
    vim.api.nvim_buf_set_option(bufn, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(bufn, 'bufhidden', 'wipe')
    vim.api.nvim_win_set_cursor(0, { 1, 1 })
end


vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            render_start_screen()
        end
    end
})

vim.api.nvim_create_autocmd("WinResized", {
    callback = function()
        if vim.b.name == "StartMenu" then
            render_start_screen()
        end
    end
})

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
        table.insert(result_flags, "local-unsaved")
    end

    -- Check for unpushed commits
    local unpushed = run_git_command('git -C "' .. git_path .. '" log --branches --not --remotes')
    if unpushed ~= "" then
        table.insert(result_flags, "unpushed")
    end

    -- Fetch remote and check for new commits
    run_git_command('git -C "' .. git_path .. '" fetch')
    local remote = run_git_command('git -C "' .. git_path .. '" log --remotes --not --branches')
    if remote ~= "" then
        table.insert(result_flags, "remote")
    end

    return result_flags
end

vim.api.nvim_create_user_command("OpenStartMenu", render_start_screen, {})

vim.defer_fn(function()
    local status = check_git_status("C:\\Users\\owend\\AppData\\Local\\nvim")
    if #status == 0 then
            vim.notify("Neovim config synchronized ✓")
    else
        for _, alert in pairs(status) do
            vim.notify("Neovim config is not synchronized: " .. alert, "warn")
        end
    end
end, 10)
