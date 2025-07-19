return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
        require("lsp_signature").setup({
            hint_prefix = "",
            hint_inline = function() return "eol" end,
            doc_lines = 0,
            floating_window = false,
            hint_scheme = "Comment"
        })
    end
}
