return {
    "Owen-Dechow/setup_sys.nvim",
    cmd = "Setup",
    config = function()
        vim.api.nvim_create_user_command("Setup", function() end, {})
    end,
    dependencies = {
        "rcarriga/nvim-notify",
        "lewis6991/gitsigns.nvim",
        "tiagovla/tokyodark.nvim",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/nvim-cmp",
        "nvim-neo-tree/neo-tree.nvim",
        "Owen-Dechow/nvim_wurd_spel",
        "nvim-telescope/telescope-ui-select.nvim",
        "Owen-Dechow/scroll_eof_ctrl_e",
        "mason-org/mason.nvim",
        "nvimtools/none-ls.nvim",
        'nvim-lualine/lualine.nvim',
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "rcarriga/nvim-notify",
        "neovim/nvim-lspconfig",
        "pmizio/typescript-tools.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
}
