local lang = {}
local conf = require("modules.lang.config")
local active = require("modules.active")

lang["nvim-treesitter/nvim-treesitter"] = {
    opt = true,
    event = "BufRead",
    after = "telescope.nvim",
    config = conf.nvim_treesitter,
    disable = not active.treesitter,
}

lang["nvim-treesitter/nvim-treesitter-textobjects"] = {
  	after = "nvim-treesitter",
    disable = not active.treesitter_textobjects,
}

lang["davidhalter/jedi-vim"] = {
    opt = true,
    ft = "python",
    config = conf.jedi_vim,
    disable = not active.jedi,
}

return lang


