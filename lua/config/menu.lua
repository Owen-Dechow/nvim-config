---@diagnostic disable: undefined-global

local version = vim.version()
version = version.major .. "." .. version.minor .. "." .. version.patch

local git_cmd = "git --git-dir=\"" .. vim.fs.joinpath(vim.fn.stdpath("config"), ".git") .. "\" rev-parse --short "

local function utf8len(str)
    local _, count = string.gsub(str, "[^\128-\191]", "")
    return count
end

local function get_latest_commit_short_hash()
    local handle = io.popen(git_cmd .. "HEAD")
    if handle == nil then return nil end

    local result = handle:read("*a")
    handle:close()
    return result:gsub("%s+", "")
end

local function get_remote_latest_commit_short_hash()
    local handle = io.popen(git_cmd .. "origin/main")
    if handle == nil then return nil end

    local short_hash = handle:read("*a")
    handle:close()
    return short_hash:gsub("%s+", "")
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

    vim.defer_fn(function()
        local local_ = get_latest_commit_short_hash()
        local remote = get_remote_latest_commit_short_hash()

        local text;
        if local_ ~= nil or remote ~= nil then
            if local_ ~= remote then
                text = {
                    "Local and remote configs out of sync.",
                    "Local: " .. local_ .. " | Remote: " .. remote, ""
                , ""
                }
            else
                text = {
                    "Local and remote configs synced at " .. local_ .. ".",
                    "",
                    ""
                }
            end

            local config_text = {}
            for key, line in pairs(text) do
                if type(line) == "function" then
                    line = line()
                end

                local t_width = utf8len(line)
                if t_width < w_width then
                    local add = math.floor((w_width - t_width) / 2)
                    config_text[key] = string.rep(" ", add) .. line
                else
                    config_text[key] = line
                end
            end

            vim.api.nvim_buf_set_option(bufn, "modifiable", true)
            vim.api.nvim_buf_set_text(bufn, #new_text - 1, 0, #new_text - 1, 0, config_text)
            vim.api.nvim_buf_set_option(bufn, "modifiable", false)
        end
    end, 0)
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

vim.api.nvim_create_user_command("OpenStartMenu", render_start_screen, {})
