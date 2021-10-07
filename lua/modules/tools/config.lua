local config = {}

function config.vim_vista()
	vim.g["vista#renderer#enable_icon"] = 1
	vim.g.vista_disable_statusline = 1
	vim.g.vista_default_executive = "lspconfig"
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

	local normal_leader_mappings = {
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
			h = {":lua require('gitsigns').preview_hunk()<CR>", "Info Hunk"},
			s = {":lua require('gitsigns').stage_hunk()<CR>", "Stage Hunk"},
			S = {":lua require('gitsigns').stage_buffer()<CR>", "Stage Buffer(file)"},
			u = {":lua require('gitsigns').undo_stage_hunk()<CR>", "Undo Stage Hunk"},
			r = {":lua require('gitsigns').reset_hunk()<CR>", "Undo Hunk"},
			R = {":lua require('gitsigns').reset_buffer()<CR>", "Undo Buffer(file)"},
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

	local normal_leader_opts = {
        mode = "n",          -- NORMAL mode
        prefix = "<leader>", -- `\` launch
        buffer = nil,        -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true,       -- use `silent` when creating keymaps
        noremap = true,      -- use `noremap` when creating keymaps
        nowait = true,       -- use `nowait` when creating keymaps
    }

	wk.register(normal_leader_mappings, normal_leader_opts)

    local normal_mappings = {
        g = {
            name = "Goto",
            D = {":lua vim.lsp.buf.declaration()<CR>", "Goto declaration"},
            d = {":lua vim.lsp.buf.definition()<CR>", "Goto definition"},
            i = {":lua vim.lsp.buf.implementation()<CR>", "Goto implementation"},
            r = {":lua vim.lsp.buf.references()<CR>", "Goto references"}
        },
        ["["] = {
            name = "Previous",
			c = {":lua require('gitsigns').next_hunk()<CR>", "Previous Hunk"},
            d = {":lua vim.lsp.diagnostic.goto_prev()<CR>", "Previous diagnostic"},
        },
        ["]"] = {
            name = "Next",
			c = {":lua require('gitsigns').prev_hunk()<CR>", "Next Hunk"},
            d = {":lua vim.lsp.diagnostic.goto_next()<CR>", "Next diagnostic"},
        },
        [" "] = {
            name = "space",
            f = {":lua vim.lsp.buf.formatting()<CR>", "Formatting"}
        }
    }
    local normal_opts = {
        mode = "n",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true
    }
    wk.register(normal_mappings, normal_opts)

end

return config

