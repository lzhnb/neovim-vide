local editor = {}
local cfg = require("modules.tools.config")

editor["nvim-telescope/telescope.nvim"] = {
    opt = true,
    cmd = "Telescope",
    config = cfg.telescope,
    requires = {
        {"nvim-lua/plenary.nvim", opt = true}
    },
}

return editor

