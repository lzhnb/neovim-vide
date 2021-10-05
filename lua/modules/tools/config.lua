local config = {}

function config.vim_vista()
	vim.g["vista#renderer#enable_icon"] = 1
	vim.g.vista_disable_statusline = 1
	vim.g.vista_default_executive = "coc"
	vim.g.vista_echo_cursor_strategy = "floating_win"
	vim.g.vista_vimwiki_executive = "markdown"
	vim.g.vista_executive_for = {
    	vimwiki =  "markdown",
    	pandoc = "markdown",
    	markdown = "toc",
  	}
end

function config.which_key()
	local wk = require("which-key")

	local wk_mappings = {
		-- file operation mapping
		f = {
			name = "file-telescope", -- optional group name
			-- create bindings
			f = {":Telescope find_files<CR>", "Find File"},       -- find file using telescope(ctrl-p)
			b = {":Telescope find_buffers<CR>", "Find Buffer"},    -- find buffer using telescope
			g = {":Telescope live_grep<CR>", "live grep"},         -- grep using telescope
			h = {":Telescope help_tags<CR>", "telescope healp"},   -- telescope help
			n = {":enew<CR>", "New File"},                         -- create a new empty buffer
			["1"] = "which_key_ignore",                            -- special label to hide it in the popup
		},
		g = {
			name = "git",
			h = {":CocCommand git.chunkInfo<CR>", "Info Hunk"},    -- show the git hunk information
			s = {":CocCommand git.chunkStage<CR>", "Stage Hunk"},  -- save the hunk change
			u = {":CocCommand git.chunkUndo<CR>", "Undo Hunk"},    -- undo the hunk
			c = {":CocCommand git.showCommit<CR>", "Show Commit"},  -- show commit information
		},
		v = {":Vista!!<CR>", "Tagbar"} -- using vista to realize tag bar
	}

	local wk_opts = {prefix = "<leader>"}

	wk.register(wk_mappings, wk_opts)
end

return config

