return {
    "alex-popov-tech/store.nvim",
    dependencies = {
        "OXY2DEV/markview.nvim", -- optional, for pretty readme preview / help window
    },
    cmd = "Store",
    opts = {
        preview_debounce = 0,
        width = .9,
        proportions = {
            list = 0.4,
            preview = 0.6,
        },
    },
}
