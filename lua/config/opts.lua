---@diagnostic disable: undefined-global

-- Block Cursor
vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250"

-- Numbers
vim.o.nu = true
vim.o.relativenumber = true

-- Tabs as space
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Tabline
vim.o.showtabline = 1

-- Smart indent
vim.o.smartindent = true

-- Undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.undodir = vim.env.HOME .. "/.vim/undodir"
vim.o.undofile = true

vim.o.scrolloff = 8
vim.opt.fillchars = { eob = " " }
vim.diagnostic.enable()

vim.wo.wrap = false

vim.o.winborder = 'rounded'

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "quickfix",
    callback = function()
        vim.schedule(function()
            vim.cmd("cclose")
            require('telescope.builtin').quickfix()
        end)
    end,
})

