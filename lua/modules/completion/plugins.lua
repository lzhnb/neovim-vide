local completion = {}
local cfg = require("modules.completion.config")

completion["neoclide/coc.nvim"] = {
	branch = "release",
    opt = true,
    event = "BufRead",
	config = cfg.coc,
}

return completion

