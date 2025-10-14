require("config.lazy")
require("config.opts")
require("config.menu")

vim.defer_fn(
    function()
        require("config.remap")
        require("config.cmds")
    end, 0
)
