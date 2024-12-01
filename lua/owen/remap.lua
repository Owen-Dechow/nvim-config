vim.g.mapleader = " "                                     -- Set leader

vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)             -- Go to explorer

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")              -- Move line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")              -- Move line down

vim.keymap.set("n", "J", "mzJ`z")                         -- Combine lines keep cursor

vim.keymap.set("x", "<leader>p", [["_dP]])                -- Paste without changing clipboard

vim.keymap.set({ "n", "v" }, "<leader>y", [["+Y]])        -- copy to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])                 -- copy to clipboard

vim.keymap.set("i", "<C-c>", "<Esc>")                     -- Exit C-c same as esc

vim.keymap.set("v", "U", "U<leader>gv")                   -- Change to uppercase
vim.keymap.set("v", "u", "u<leader>gv")                   -- Change to lowercase

vim.keymap.set("n", "<leader>wd", vim.diagnostic.disable) -- disable diagnostic
vim.keymap.set("n", "<leader>we", vim.diagnostic.enable)  -- enable diagnostic
vim.keymap.set({ "n", "v" }, "<leader>ws", vim.diagnostic.open_float)
vim.keymap.set({ "n", "v" }, "<leader>wn", vim.diagnostic.goto_next)

vim.opt.mouse = "" -- Disable mouse controls

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set({ "n", "v" }, "<leader>.", "<Plug>(coc-codeaction-line)")
vim.keymap.set('n', '<leader>gd', '<Plug>(coc-definition)', {})
vim.keymap.set('n', '<leader>gr', '<Plug>(coc-references)', {})
vim.keymap.set('n', '<leader>rr', '<Plug>(coc-rename)', {})
vim.keymap.set('n', '<leader>fb', ':CocCommand editor.action.formatDocument<CR>', { noremap = true, silent = true })

-- Function to handle Tab in insert and select mode for coc.nvim
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-y>" : "\\<Tab>"',
    { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'pumvisible() ? "\\<C-y>" : "\\<Tab>"',
    { noremap = true, expr = true, silent = true })
