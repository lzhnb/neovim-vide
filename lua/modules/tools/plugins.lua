local tools = {}
local cfg = require("modules.tools.config")

tools["liuchengxu/vista.vim"] = {
    opt = true,
    cmd = "Vista",
    config = cfg.vim_vista
}

tools["dstein64/vim-startuptime"] ={
    opt = true,
    cmd = "StartupTime",
}

tools["folke/which-key.nvim"] = {
    opt = true,
    keys = "\\",
    config = cfg.which_key
}

return tools

