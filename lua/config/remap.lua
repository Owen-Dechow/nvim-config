-- Move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up" })

-- Paste without changing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "No copy paste" })

-- Copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to \"+" })

-- Esc same as crtl-c
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Escape" })

-- Do not deselect after u/U
vim.keymap.set("v", "U", "Ugv", { desc = "Make uppercase" })
vim.keymap.set("v", "u", "ugv", { desc = "Make lowercase" })

-- Non copy delete
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "No copy delete" })

-- Clear search
vim.keymap.set("n", "<leader>ch", "<CMD>noh<CR>", { desc = "Clear search highlights" })

-- Save/Close
vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>", { desc = "Delete buffer" })

-- LSP
vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<leader>H", vim.diagnostic.open_float, { desc = "Diagnostic float" })
