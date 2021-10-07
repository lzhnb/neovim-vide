-- manage the plugins active or not
local active = {
    -- ui
    onedark = true,
    web_devicons = true,
    dashboard = false,
    barbar = true,
    lualine = true,
    tree = true,
    -- editor
    plenary = true,
    telescope = true,
    comment = true,
    ts_context_commentstring = true,
    toggleterm = false,
    -- language
    treesitter = true,
    treesitter_textobjects = true,
    jedi = true,
    -- tools
    vista = true,
    which_key = true,
    startuptime = true,
    -- completion
    LuaSnip = true,
    lspconfig = true,
    lspinstall = true,
    cmp = true,    
}

return active

