local lang = {}
local conf = require("modules.lang.config")

lang["nvim-treesitter/nvim-treesitter"] = {
    opt = true,
    event = "BufRead",
    after = "telescope.nvim",
    config = conf.nvim_treesitter,
}

lang["nvim-treesitter/nvim-treesitter-textobjects"] = {
  	after = "nvim-treesitter"
}

lang["davidhalter/jedi-vim"] = {
    opt = true,
    ft = "python",
    config = conf.jedi_vim
}

return lang


