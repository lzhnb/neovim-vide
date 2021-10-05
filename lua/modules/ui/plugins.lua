local ui = {}
local cfg = require("modules.ui.config")

ui["navarasu/onedark.nvim"] = {
    config = [[vim.cmd("colorscheme onedark")]]
}

ui["nvim-web-devicons"] = {}

ui["romgrk/barbar.nvim"] = {}

ui["hoob3rt/lualine.nvim"] = {
    config = cfg.lualine,
}

ui["kyazdani42/nvim-tree.lua"] = {
  	-- cmd = "NvimTreeToggle",
  	config = cfg.nvim_tree,
}

return ui


