vim.pack.add({
    "https://github.com/nvim-neo-tree/neo-tree.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/MunifTanjim/nui.nvim",
})

require("neo-tree").setup({
    window = {
        position = "right"
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function(_)
                require("neo-tree.command").execute({ action = "close" })
            end
        },

    }
})

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')
