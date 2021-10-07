local tools = {}
local cfg = require("modules.tools.config")
local active = require("modules.active")

tools["liuchengxu/vista.vim"] = {
    opt = true,
    cmd = "Vista",
    config = cfg.vim_vista,
    disable = not active.vista,
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

