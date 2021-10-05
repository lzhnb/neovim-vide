local editor = {}
local cfg = require("modules.tools.config")

editor["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    config = cfg.telescope,
    requires = {
        {"nvim-lua/plenary.nvim", opt = true}
    },
}

editor["nvim-lua/plenary.nvim"] = {
    cmd = {"gc", "gcc"},
}

return editor

