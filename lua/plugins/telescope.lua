local function normalize_path(path)
    local uname = vim.loop.os_uname()
    if uname.sysname == "Windows_NT" then
        return path:gsub("/", "\\")
    else
        return path:gsub("\\", "/")
    end
end

local file_ignore_patterns = {
    "bin/",
    "obj/",
    "%.class",
    "%.meta",
    "%.xsd",
    "%.asset",
    "%.wav",
    "%.png",
    "%.jpg",
    "%.jpeg",
    "node_modules/",
}

for k, v in pairs(file_ignore_patterns) do
    file_ignore_patterns[k] = normalize_path(v)
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = file_ignore_patterns
            }
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope find git files" })
        vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>ls", builtin.buffers, { desc = "Telescope find buffers" })
    end
}
