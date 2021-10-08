-- mapping
local bind = require("core.bind")
local map = bind.map

local keymap = {
    -- vim switch options
    ["n|<F3>"] = map(":set hlsearch!<CR>"):with_noremap():with_silent(),
    ["n|<F4>"] = map(":set paste!<CR>"):with_noremap():with_silent(),
    -- buffer options
    ["n|<C-J>"] = map(":BufferLineCyclePrev<CR>"):with_noremap():with_silent(),
    ["n|<C-K>"] = map(":BufferLineCycleNext<CR>"):with_noremap():with_silent(),
    ["n|<C-D>"] = map(":bdelete<CR>"):with_noremap():with_silent(),
    ["n|<A-j>"] = map(":BufferLineMovePrev<CR>"):with_noremap():with_silent(),
    ["n|<A-k>"] = map(":BufferLineMoveNext<CR>"):with_noremap():with_silent(),
    ["n|<A-1>"] = map(":BufferLineGoToBuffer 1<CR>"):with_noremap():with_silent(),
    ["n|<A-2>"] = map(":BufferLineGoToBuffer 2<CR>"):with_noremap():with_silent(),
    ["n|<A-3>"] = map(":BufferLineGoToBuffer 3<CR>"):with_noremap():with_silent(),
    ["n|<A-4>"] = map(":BufferLineGoToBuffer 4<CR>"):with_noremap():with_silent(),
    ["n|<A-5>"] = map(":BufferLineGoToBuffer 5<CR>"):with_noremap():with_silent(),
    ["n|<A-6>"] = map(":BufferLineGoToBuffer 6<CR>"):with_noremap():with_silent(),
    ["n|<A-7>"] = map(":BufferLineGoToBuffer 7<CR>"):with_noremap():with_silent(),
    ["n|<A-8>"] = map(":BufferLineGoToBuffer 8<CR>"):with_noremap():with_silent(),
    ["n|<A-9>"] = map(":BufferLineGoToBuffer 9<CR>"):with_noremap():with_silent(),
    
    -- Insert mode
    ["i|<C-s>"] = map("<Esc>:w<CR>"),
    ["i|<C-q>"] = map("<Esc>:wq<CR>"),
}

bind.nvim_load_mapping(keymap)

