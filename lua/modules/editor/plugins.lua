local editor = {}
local cfg = require("modules.tools.config")

editor["nvim-telescope/telescope.nvim"] = {
    opt = true,
    cmd = "Telescope",
    after = "dashboard-nvim",
    config = cfg.telescope,
    requires = {
        {"nvim-lua/plenary.nvim", opt = true}
    },
}

editor["terrortylor/nvim-comment"] = {
    opt = false,
    config = function() require("nvim_comment").setup({
        hook = function()
            require("ts_context_commentstring.internal").update_commentstring()
        end,
    }) end
}

editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
    opt = true,
    after = "nvim-treesitter"
}

return editor

