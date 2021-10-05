local completion = {}
local cfg = require("modules.completion.config")

completion["neoclide/coc.nvim"] = {
	branch = "release",
	config = cfg.coc,
}

return completion

