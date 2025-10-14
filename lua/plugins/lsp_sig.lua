return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        hint_enable = false,
        max_width = function()
            local target = vim.api.nvim_win_get_width(0) * 0.8
            if target > 80 then
                return 80
            else
                return target
            end
        end,
    },
}
