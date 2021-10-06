-- mapping
local bind = require("core.bind")
local map = bind.map

local keymap = {
    ["n|<F3>"] = map(":set hlsearch!<CR>"):with_noremap():with_silent(),
    ["n|<F4>"] = map(":set paste!<CR>"):with_noremap():with_silent(),
    ["n|<C-J>"] = map(":bprev<CR>"):with_noremap():with_silent(),
    ["n|<C-K>"] = map(":bnext<CR>"):with_noremap():with_silent(),
    ["n|<C-D>"] = map(":bdelete<CR>"):with_noremap():with_silent(),
    ["n|<C-N>"] = map(":NvimTreeToggle<CR>"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(keymap)

-- vim.cmd [[nmap <leader>g[ <Plug>(coc-git-prevchunk)]]
-- vim.cmd [[nmap <leader>g] <Plug>(coc-git-nextchunk)]]

