local completion = {}
local cfg = require("modules.completion.config")
local active = require("modules.active")

completion["L3MON4D3/LuaSnip"] = {
    after = "nvim-cmp",
    config = cfg.luasnip,
    requires = "rafamadriz/friendly-snippets",
    disable = not active.LuaSnip,
}

completion["neovim/nvim-lspconfig"] = {
    opt = true,
    event = "BufReadPre",
    config = cfg.nvim_lsp,
    disable = not active.lspconfig,
}

completion["kabouzeid/nvim-lspinstall"] = {
    opt = true,
    after = "nvim-lspconfig",
    disable = not active.lspinstall,
}

completion["ray-x/lsp_signature.nvim"] = {
    opt = true,
    after = "nvim-lspconfig",
    disable = not active.lspsignature,
}

completion["hrsh7th/nvim-cmp"] = {
    config = cfg.cmp,
    event = "InsertEnter",
    requires = {
        {"saadparwaiz1/cmp_luasnip", after = "LuaSnip"},
        {"hrsh7th/cmp-buffer", after = "cmp_luasnip"},
        {"hrsh7th/cmp-nvim-lsp", after = "cmp-buffer"},
        {"hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp"},
        {"andersevenrud/compe-tmux", branch = "cmp", after = "cmp-nvim-lua"},
        {"hrsh7th/cmp-path", after = "compe-tmux"},
        {"f3fora/cmp-spell", after = "cmp-path"}
    },
    disable = not active.cmp,
}


return completion

