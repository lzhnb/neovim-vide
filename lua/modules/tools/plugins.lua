local tools = {}
local cfg = require("modules.tools.config")
local active = require("modules.active")

tools["simrat39/symbols-outline.nvim"] = {
    opt = true,
    cmd = "SymbolsOutline",
	config = cfg.symbols_outline,
    disable = not active.symbols_outline,
}

tools["dstein64/vim-startuptime"] ={
    opt = true,
    cmd = "StartupTime",
    disable = not active.startuptime,
}

tools["folke/which-key.nvim"] = {
    opt = true,
    event = "BufRead",
    config = cfg.which_key,
    disable = not active.which_key,
}

return tools

