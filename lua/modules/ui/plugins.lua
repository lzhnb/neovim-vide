local ui = {}
local cfg = require("modules.ui.config")

ui["navarasu/onedark.nvim"] = {
    config = [[vim.cmd("colorscheme onedark")]]
}

ui["nvim-web-devicons"] = {}

ui["romgrk/barbar.nvim"] = {
    opt = true,
    event = "BufRead",
}

ui["hoob3rt/lualine.nvim"] = {
    opt = true,
	after = "nvim-gps",
    config = cfg.lualine,
}

ui["kyazdani42/nvim-tree.lua"] = {
  	-- cmd = "NvimTreeToggle",
  	config = cfg.nvim_tree,
}

return ui


