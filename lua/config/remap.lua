-- Move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste without changing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to clipboard
vim.keymap.set("v", "<leader>y", '"+y')

-- Esc same as crtl-c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Do not deselect after u/U
vim.keymap.set("v", "U", "U<leader>gv")
vim.keymap.set("v", "u", "u<leader>gv")

-- Non copy delete
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- Clear search
vim.keymap.set("n", "<leader>ch", "<CMD>noh<CR>")

-- Save/Close
vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>")

-- Telescope
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope_builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>lg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set("n", "<leader>ls", telescope_builtin.buffers)

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Neogit
vim.keymap.set("n", "<leader>ng", "<CMD>Neogit<CR>")

-- LSP
vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>H", require("pretty_hover").hover)
vim.keymap.set("n", "<leader>h", function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local diagnostics = vim.diagnostic.get(0, { lnum = cursor_pos[1] - 1 })

    if #diagnostics > 0 then
        vim.diagnostic.open_float(nil, { focusable = false })
    else
        require("pretty_hover").hover()
    end
end)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next)

-- Neotree
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

-- Cmp
local cmp = require("cmp")
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    })
})

-- Spelling
vim.keymap.set("n", "<leader>zz", "<CMD>WurdSpel suggest<CR>")
vim.keymap.set("n", "<leader>zw", "<CMD>WurdSpel bad<CR>")
vim.keymap.set("n", "<leader>zg", "<CMD>WurdSpel good<CR>")
