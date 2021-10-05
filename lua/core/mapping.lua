-- mapping
local function map(mode, lhs, rhs, opts)
  	local options = {noremap = true}
  	if opts then options = vim.tbl_extend("force", options, opts) end
  	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opts = {noremap=true, silent=true}

map("n", "<F3>", ":set hlsearch!<CR>", opts)
map("n", "<F4>", ":set paste!<CR>", opts)
map("n", "<C-K>", ":bnext<CR>", opts)
map("n", "<C-J>", ":bprev<CR>", opts)
map("n", "<C-D>", ":bdelete<CR>", opts)
map("n", "<C-N>", ":NvimTreeToggle<CR>", opts)



