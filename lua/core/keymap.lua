-- mapping
local bind = require("core.bind")
local map = bind.map

local keymap = {
    -- vim switch options
    ["n|<F3>"] = map(":set hlsearch!<CR>"):with_noremap():with_silent(),
    ["n|<F4>"] = map(":set paste!<CR>"):with_noremap():with_silent(),
    -- buffer options
    ["n|<C-J>"] = map(":BufferPrevious<CR>"):with_noremap():with_silent(),
    ["n|<C-K>"] = map(":BufferNext<CR>"):with_noremap():with_silent(),
    ["n|<M-j>"] = map(":BufferMovePrevious<CR>"):with_noremap():with_silent(),
    ["n|<M-k>"] = map(":BufferMoveNext<CR>"):with_noremap():with_silent(),
    ["n|<M-1>"] = map(":BufferGoto 1<CR>"):with_noremap():with_silent(),
    ["n|<M-2>"] = map(":BufferGoto 2<CR>"):with_noremap():with_silent(),
    ["n|<M-3>"] = map(":BufferGoto 3<CR>"):with_noremap():with_silent(),
    ["n|<M-4>"] = map(":BufferGoto 4<CR>"):with_noremap():with_silent(),
    ["n|<M-5>"] = map(":BufferGoto 5<CR>"):with_noremap():with_silent(),
    ["n|<M-6>"] = map(":BufferGoto 6<CR>"):with_noremap():with_silent(),
    ["n|<M-7>"] = map(":BufferGoto 7<CR>"):with_noremap():with_silent(),
    ["n|<M-8>"] = map(":BufferGoto 8<CR>"):with_noremap():with_silent(),
    ["n|<M-9>"] = map(":BufferGoto 9<CR>"):with_noremap():with_silent(),
    ["n|<M-0>"] = map(":BufferLast<CR>"):with_noremap():with_silent(),
    ["n|<C-D>"] = map(":BufferClose<CR>"):with_noremap():with_silent(),
    -- tree toggle
    ["n|<C-N>"] = map(":NvimTreeToggle<CR>"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(keymap)

