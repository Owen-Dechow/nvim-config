return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
        hint_prefix = "⮜ ",
        hint_inline = function() return "eol" end,
        doc_lines = 0,
        floating_window = false,
        hint_scheme = "Comment"
    }
}
