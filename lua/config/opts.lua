-- Block Cursor
vim.opt.guicursor = {
    "n-v-c:block-blinkon1-blinkoff1",
    "i-ci:ver25-blinkon1-blinkoff1",
}

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

vim.diagnostic.enable()
vim.diagnostic.config({
    signs = false,
    virtual_text = true,
    severity_sort = true,
})

vim.wo.wrap = false

vim.o.winborder = 'rounded'

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 0
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "0"
