local editor = {}
local cfg = require("modules.tools.config")
local active = require("modules.active")

editor["nvim-telescope/telescope.nvim"] = {
    opt = true,
    cmd = "Telescope",
    config = cfg.telescope,
    requires = {
        {"nvim-lua/plenary.nvim", opt = true},
        {"nvim-lua/popup.nvim", opt = true}
    },
    disable = not active.telescope,
}

editor["b3nj5m1n/kommentary"] = {
    opt = true,
    after = "nvim-treesitter",
    config = cfg.comment,
    disable = not active.comment,
}

editor["folke/todo-comments.nvim"] = {
    opt = true,
    after = "nvim-treesitter",
    config = cfg.todo_comments,
    disable = not active.todo_comments,
}

return editor

