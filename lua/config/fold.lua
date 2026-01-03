vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 0
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "0"

function FoldColumn()
    local lnum = vim.v.lnum
    local foldlevel = vim.fn.foldlevel(lnum)
    local closed = vim.fn.foldclosed(lnum)

    -- No fold here
    if foldlevel == 0 then
        return "  "
    end

    -- Closed fold: always show the closed icon
    if closed ~= -1 then
        return ""
    end

    -- Open fold: show icon ONLY on the first line of the fold
    local prev_foldlevel = vim.fn.foldlevel(lnum - 1)
    if foldlevel > prev_foldlevel then
        return ""
    end

    -- Inside the fold: show nothing
    return " "
end

vim.opt.statuscolumn = "%s%{v:lua.FoldColumn()}%l"
