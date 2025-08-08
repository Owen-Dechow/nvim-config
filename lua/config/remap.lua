-- Move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste without changing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')

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

vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format)

