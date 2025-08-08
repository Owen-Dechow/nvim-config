---@diagnostic disable: undefined-global

-- Block Cursor
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250"

-- Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tabs as space
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Tabline
vim.opt.showtabline = 1

-- Smart indent
vim.opt.smartindent = true

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = vim.env.HOME .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
-- vim.opt.fillchars = { eob = " " }
vim.diagnostic.enable()

vim.wo.wrap = false

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "quickfix",
    callback = function()
        vim.schedule(function()
            vim.cmd("cclose")
            require('telescope.builtin').quickfix()
        end)
    end,
})

