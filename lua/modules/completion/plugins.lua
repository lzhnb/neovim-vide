local completion = {}
local cfg = require("modules.completion.config")
local active = require("modules.active")

completion["neoclide/coc.nvim"] = {
	branch = "release",
    opt = true,
    event = "BufRead",
	config = cfg.coc,
    disable = not active.coc,
}

return completion

