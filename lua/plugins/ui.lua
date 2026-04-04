vim.pack.add({
    "https://github.com/nvim-telescope/telescope-ui-select.nvim",
    "https://github.com/rcarriga/nvim-notify",
    'https://github.com/nvim-lualine/lualine.nvim',
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/hedyhli/outline.nvim",
    'https://github.com/nacro90/numb.nvim',
})

require("telescope").setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    }
}
require("telescope").load_extension("ui-select")

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "quickfix",
    callback = function()
        vim.schedule(function()
            vim.cmd("cclose")
            require('telescope.builtin').quickfix()
        end)
    end,
})

vim.notify = function(msg, level)
    require("notify").setup({
        stages = "static",
        top_down = false,
        render = "wrapped-compact",
    })
    vim.notify = require("notify")
    vim.notify(msg, level)
end

require("lualine").setup({
    options = {
        globalstatus = true,
    }
})

vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
    { desc = "Toggle Outline" })

require("outline").setup {
}

require('numb').setup()
