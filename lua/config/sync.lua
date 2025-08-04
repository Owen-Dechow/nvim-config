local git_path = vim.fn.stdpath("config")

local function run_git_command(args, callback)
    vim.system(args, { cwd = git_path }, callback)
end


local function check_git_status()
    local result_flags = {}
    local function check_stage(args, flag)
        run_git_command(args, function(obj)
            local status = vim.trim(obj.stdout or "")
            if status == "" then
                result_flags[flag] = false
            else
                result_flags[flag] = true
            end


            if vim.tbl_count(result_flags) == 3 then
                local notifications = false;
                for key, val in pairs(result_flags) do
                    if val then
                        vim.notify("Neovim config is not synchronized: " .. key, "WARN")
                        notifications = true;
                    end
                end

                if not notifications then
                    vim.notify("Neovim config synchronized ✓")
                end
            end
        end)
    end

    check_stage({ "git", "status", "--porcelain" }, "local-unsaved")
    check_stage({ "git", "log", "--branches", "--not", "--remotes" }, "local-unpushed")
    run_git_command({ "git", "fetch" }, function() end)
    check_stage({ "git", "log", "--remotes", "--not", "--branches" }, "remote-unpulled")
end

check_git_status()
