local ui = {}
local cfg = require("modules.ui.config")
local active = require("modules.active")

ui["navarasu/onedark.nvim"] = {
    opt = true,
    event = "BufWinEnter",
    config = [[vim.cmd("colorscheme onedark")]],
    disable = not active.onedark,
}

ui["kyazdani42/nvim-web-devicons"] = {
    opt = false,
    disable = not active.web_devicons,
}

ui["glepnir/dashboard-nvim"] = {
    opt = true,
    event = "BufWinEnter",
    config = cfg.dashboard,
    disable = not active.dashboard,
}

ui["romgrk/barbar.nvim"] = {
    opt = true,
    event = "BufRead",
    disable = not active.barbar,
}

ui["hoob3rt/lualine.nvim"] = {
    opt = true,
	event = "BufRead",
    config = cfg.lualine,
    disable = not active.lualine,
}

ui["kyazdani42/nvim-tree.lua"] = {
  	opt = true,
    cmd = "NvimTreeToggle",
  	config = cfg.nvim_tree,
    disable = not active.tree,
}

return ui


