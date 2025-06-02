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

-- Smart indent
vim.opt.smartindent = true

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
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

-- Diagnostic
vim.diagnostic.config({
    float = {
        border = "rounded",
    },
})

local last_pos = nil;
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        local current_pos = table.concat(vim.api.nvim_win_get_cursor(0), ",")
        if current_pos ~= last_pos then
            vim.diagnostic.open_float(nil, { focusable = false })
            last_pos = current_pos
        end
    end,
})

vim.o.updatetime = 500
