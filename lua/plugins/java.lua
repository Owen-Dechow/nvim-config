local function normalize_path(path)
    local uname = vim.loop.os_uname()
    if uname.sysname == "Windows_NT" then
        return path:gsub("/", "\\")
    else
        return path:gsub("\\", "/")
    end
end

return {
    {
        "mfussenegger/nvim-jdtls",
        ft = { "java" },
        config = function()
            local config = {
                cmd = {
                    normalize_path(vim.fn.stdpath("data") .. "/mason/bin/jdtls")
                },
                root_dir = vim.fs.dirname(vim.fs.find(
                    {
                        'gradlew',
                        '.git',
                        'mvnw',
                        ".project",
                        ".classpath"
                    },
                    { upward = true })[1]),
                on_attach = function(client)
                    require('lsp-overloads').setup(client, {
                        keymaps = {
                            next_signature = "<C-j>",
                            previous_signature = "<C-k>",
                            close_signature = "<Tab>",
                        },
                        display_automatically = true,
                        silent = false,
                        ui = {
                            max_width = 60,
                            border = "rounded",
                            max_height = 5,
                            floating_window_above_cur_line = true,
                        }
                    })
                end
            }

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = function()
                    require('jdtls').start_or_attach(config)
                end,
            })
        end,
    },
}
