local editor = {}
local cfg = require("modules.tools.config")
local active = require("modules.active")

editor["nvim-telescope/telescope.nvim"] = {
    opt = true,
    cmd = "Telescope",
    config = cfg.telescope,
    requires = {
        {"nvim-lua/plenary.nvim", opt = true}
    },
    disable = not active.telescope,
}

editor["terrortylor/nvim-comment"] = {
    opt = false,
    config = function() require("nvim_comment").setup({
        hook = function()
            require("ts_context_commentstring.internal").update_commentstring()
        end,
    }) end,
    disable = not active.comment,
}

editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
    opt = true,
    after = "nvim-treesitter",
    disable = not active.ts_context_commentstring,
}

editor["akinsho/nvim-toggleterm.lua"] = {
    opt = true,
    event = "BufRead",
    config = cfg.toggleterm,
    disable = not active.toggleterm,
}

return editor

