local nb_group = vim.api.nvim_create_augroup("NBHighlightGroup", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = nb_group,
    pattern = "*.nbl",
    callback = function()
        vim.cmd [[set filetype=NotebookLang]]
        vim.cmd [[syn match Identifier "\v[A-Za-z_]\w*"]]
        vim.cmd [[syn keyword Keyword def static let impl capture raise open]]
        vim.cmd [[syn keyword Type Z R S B N]]
        vim.cmd [[syn keyword Boolean true false]]
        vim.cmd [[syn match Number "\v<[0-9]%(_*[0-9])*>|<0[xX]_*[0-9a-fA-F]%(_*[0-9a-fA-F])*>|<0[oO]_*%(_*[0-7])*>|<0[bB]_*[01]%(_*[01])*>"]]
        vim.cmd [[syn region String	start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=SpecialChar]]
        vim.cmd [[syn match Operator "[<>=~^*/+-.:?%$]"]]
        vim.cmd [[syn match Comment "#.*$"]]
        vim.cmd [[syn match SpecialChar "\\."]]
        vim.cmd [[syn match Structure "\v(def\s+)@<=[A-Za-z_]\w+"]]
        vim.cmd [[syn match Function "\v([A-Za-z_]\w*)(\(.*\))@="]]
        vim.cmd [[syn match Function "\v([A-Za-z_]\w*)(\s*\.\s*[A-Za-z_])@="]]
    end,
})

local sigil_group = vim.api.nvim_create_augroup("SigilHighlightGroup", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = sigil_group,
    pattern = "*.sigil",
    callback = function()
        vim.cmd [[set filetype=SigilLang]]
        vim.cmd [[syn keyword Keyword invoke sigil src and or]]
        vim.cmd [[syn match Comment "#.*$"]]
        vim.cmd [[syn region String	start=+"+ skip=+\\\\\|\\"+ end=+"+]]
        vim.cmd [[syn match Number "\v<[0-9]%(_*[0-9])*>|<0[xX]_*[0-9a-fA-F]%(_*[0-9a-fA-F])*>|<0[oO]_*%(_*[0-7])*>|<0[bB]_*[01]%(_*[01])*>"]]
        vim.cmd [[syn match Operator "[<>=*/+-.:?%$!]"]]
        vim.cmd [[syn keyword Structure Whisper Loop]]
    end
})
