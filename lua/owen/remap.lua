vim.g.mapleader = " "                                    -- Set leader

vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)            -- Go to explorer
vim.keymap.set("n", "<leader>wex", ":w | :Ex | <Enter>") -- Go to explorer

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")             -- Move line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")             -- Move line down

vim.keymap.set("n", "J", "mzJ`z")                        -- Combine lines keep cursor

vim.keymap.set("x", "<leader>p", [["_dP]])               -- Paste without changing clipboard

vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format)    -- Format doc

vim.keymap.set({ "n", "v" }, "<leader>y", [["+Y]])       -- copy to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])                -- copy to clipboard

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)     -- Format text

vim.keymap.set("v", "U", "U<leader>gv")                  -- Change to uppercase
vim.keymap.set("v", "u", "u<leader>gv")                  -- Change to lowercase

