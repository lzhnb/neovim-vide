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

	local normal_mappings = {
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
			h = {":CocCommand git.chunkInfo<CR>", "Info Hunk"},
			s = {":CocCommand git.chunkStage<CR>", "Stage Hunk"},
			u = {":CocCommand git.chunkUndo<CR>", "Undo Hunk"},
			c = {":CocCommand git.showCommit<CR>", "Show Commit"},
            b = {":Telescope git_branches<CR>", "Checkout branch(Telescope)"},
            o = {":Telescope git_status<CR>", "Open changed file(Telescope)"},
            c = {":Telescope git_commits<CR>", "Checkout commit(Telescope)"},
            C = {":Telescope git_bcommits<CR>", "Checkout commit(Telescope for current file)"}
        },
        p = {
            name = "Packer",
            c = {":PackerCompile<CR>", "Compile"},
            i = {":PackerInstall<CR>", "Install"},
            s = {":PackerSync<CR>", "Sync"},
            S = {":PackerStatus<CR>", "Status"},
            u = {":PackerUpdate<CR>", "Update"}
        },
		v = {":Vista!!<CR>", "Tagbar"}, -- using vista to realize tag bar
	}

	local normal_opts = {
        mode = "n",          -- NORMAL mode
        prefix = "<leader>", -- `\` launch
        buffer = nil,        -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true,       -- use `silent` when creating keymaps
        noremap = true,      -- use `noremap` when creating keymaps
        nowait = true,       -- use `nowait` when creating keymaps
    }

	wk.register(normal_mappings, normal_opts)
end

return config

