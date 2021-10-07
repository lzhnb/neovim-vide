local config = {}

function config.symbols_outline()
	vim.g.symbols_outline = {
		highlight_hovered_item = true,
		show_guides = true,
		auto_preview = true,
		position = "right",
		width = 25,
		show_numbers = false,
		show_relative_numbers = false,
		show_symbol_details = true,
		preview_bg_highlight = "Pmenu",
		keymaps = { -- These keymaps can be a string or a table for multiple keys
			close = {"<Esc>", "q"},
			goto_location = "<Cr>",
			focus_location = "o",
			hover_symbol = "<C-space>",
			toggle_preview = "K",
			rename_symbol = "r",
			code_actions = "a",
		},
		lsp_blacklist = {},
		symbol_blacklist = {},
		symbols = {
			File = {icon = "", hl = "TSURI"},
			Module = {icon = "", hl = "TSNamespace"},
			Namespace = {icon = "", hl = "TSNamespace"},
			Package = {icon = "", hl = "TSNamespace"},
			Class = {icon = "C", hl = "TSType"},
			Method = {icon = "ƒ", hl = "TSMethod"},
			Property = {icon = "", hl = "TSMethod"},
			Field = {icon = "", hl = "TSField"},
			Constructor = {icon = "", hl = "TSConstructor"},
			Enum = {icon = "ℰ", hl = "TSType"},
			Interface = {icon = "ﰮ", hl = "TSType"},
			Function = {icon = "", hl = "TSFunction"},
			Variable = {icon = "", hl = "TSConstant"},
			Constant = {icon = "", hl = "TSConstant"},
			String = {icon = "A", hl = "TSString"},
			Number = {icon = "#", hl = "TSNumber"},
			Boolean = {icon = "⊨", hl = "TSBoolean"},
			Array = {icon = "", hl = "TSConstant"},
			Object = {icon = "⦿", hl = "TSType"},
			Key = {icon = "K", hl = "TSType"},
			Null = {icon = "NULL", hl = "TSType"},
			EnumMember = {icon = "", hl = "TSField"},
			Struct = {icon = "S", hl = "TSType"},
			Event = {icon = "Z", hl = "TSType"},
			Operator = {icon = "+", hl = "TSOperator"},
			TypeParameter = {icon = "T", hl = "TSParameter"}
		}
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
        s = {":SymbolsOutline<CR>", "Symbols Outline"}, -- using vista to realize tag bar
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

