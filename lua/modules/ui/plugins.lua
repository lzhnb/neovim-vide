local ui = {}
local cfg = require("modules.ui.config")

ui["navarasu/onedark.nvim"] = {
    opt = true,
    event = "BufWinEnter",
    config = [[vim.cmd("colorscheme onedark")]],
}

ui["kyazdani42/nvim-web-devicons"] = {opt = false}

ui["glepnir/dashboard-nvim"] = {
    opt = true,
    event = "BufWinEnter",
    config = cfg.dashboard,
}

ui["romgrk/barbar.nvim"] = {
    opt = true,
    event = "BufRead",
}

ui["hoob3rt/lualine.nvim"] = {
    opt = true,
	event = "BufRead",
    config = cfg.lualine,
}

ui["kyazdani42/nvim-tree.lua"] = {
  	opt = true,
    cmd = "NvimTreeToggle",
  	config = cfg.nvim_tree,
}

return ui


