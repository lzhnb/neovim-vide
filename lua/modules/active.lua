-- manage the plugins active or not
local active = {
    -- ui
    onedark = true,
    web_devicons = true,
    dashboard = false,
    gitsigns = true,
    bufferline = true,
    lualine = true,
    tree = true,
    -- editor
    plenary = true,
    telescope = true,
    comment = true,
    ts_context_commentstring = true,
    toggleterm = false,
    todo_comments = true,
    -- language
    treesitter = true,
    treesitter_textobjects = true,
    -- tools
    symbols_outline = true,
    trouble = true,
    which_key = true,
    startuptime = true,
    -- completion
    LuaSnip = true,
    lspconfig = true,
    lspinstall = true,
    lspsignature = true,
    cmp = true,    
}

return active

