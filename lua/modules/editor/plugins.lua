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
    opt = true,
    after = "nvim-ts-context-commentstring",
    config = cfg.comment,
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

editor["folke/todo-comments.nvim"] = {
    opt = true,
    after = "nvim-comment",
    config = cfg.todo_comments,
    disable = not active.todo_comments,
}

return editor

