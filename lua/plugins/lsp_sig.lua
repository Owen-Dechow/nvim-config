return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
        vim.api.nvim_set_hl(0, "LspSignatureVirtualText", { fg = "#44ee44" })
        require("lsp_signature").setup({
            hint_prefix = "",
            hint_inline = function() return "eol" end,
            doc_lines = 0,
            floating_window = false,
            hint_scheme = "LspSignatureVirtualText"
        })
    end
}
