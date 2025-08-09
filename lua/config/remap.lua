-- Move lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste without changing clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')

-- Esc same as crtl-c
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Do not deselect after u/U
vim.keymap.set("v", "U", "U<leader>gv")
vim.keymap.set("v", "u", "u<leader>gv")

-- Non copy delete
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- Clear search
vim.keymap.set("n", "<leader>ch", "<CMD>noh<CR>")

-- Save/Close
vim.keymap.set("n", "<leader>bd", "<CMD>bd<CR>")

-- LSP
vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>H", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>h", function()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local diagnostics = vim.diagnostic.get(0, { lnum = cursor_pos[1] - 1 })

	if #diagnostics > 0 then
		vim.diagnostic.open_float()
	else
		vim.lsp.buf.hover()
	end
end)
