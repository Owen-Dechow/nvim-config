vim.pack.add({
    "https://github.com/Owen-Dechow/videre.nvim",
    "https://github.com/Owen-Dechow/graph_view_yaml_parser",
    "https://github.com/a-usr/xml2lua.nvim",
    "https://github.com/Owen-Dechow/graph_view_toml_parser",
})

require("videre").setup({
    round_units = true,
})
