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
        event = "VeryLazy",
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
