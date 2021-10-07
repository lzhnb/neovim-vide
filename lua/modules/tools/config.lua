local config = {}

-- TODO: read
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

-- TODO: read
function config.trouble()
    require("trouble").setup {
        position = "bottom", -- position of the list can be: bottom, top, left, right
        height = 10, -- height of the trouble list when position is top or bottom
        width = 50, -- width of the list when position is left or right
        icons = true, -- use devicons for filenames
        mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
        fold_open = "", -- icon used for open folds
        fold_closed = "", -- icon used for closed folds
        action_keys = { -- key mappings for actions in the trouble list
            -- map to {} to remove a mapping, for example:
            -- close = {},
            close = "q", -- close the list
            cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
            refresh = "r", -- manually refresh
            jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
            open_split = {"<c-x>"}, -- open buffer in new split
            open_vsplit = {"<c-v>"}, -- open buffer in new vsplit
            open_tab = {"<c-t>"}, -- open buffer in new tab
            jump_close = {"o"}, -- jump to the diagnostic and close the list
            toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
            toggle_preview = "P", -- toggle auto_preview
            hover = "K", -- opens a small popup with the full multiline message
            preview = "p", -- preview the diagnostic location
            close_folds = {"zM", "zm"}, -- close all folds
            open_folds = {"zR", "zr"}, -- open all folds
            toggle_fold = {"zA", "za"}, -- toggle fold of current file
            previous = "k", -- preview item
            next = "j" -- next item
        },
        indent_lines = true, -- add an indent guide below the fold icons
        auto_open = false, -- automatically open the list when you have diagnostics
        auto_close = false, -- automatically close the list when you have no diagnostics
        auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
        auto_fold = false, -- automatically fold a file trouble list at creation
        signs = {
            -- icons / text used for a diagnostic
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "﫠"
        },
        use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    }
end

function config.todo_comments()	
	require("todo-comments").setup {  
		signs = true, -- show icons in the signs column
	    sign_priority = 8, -- sign priority
	    -- keywords recognized as todo comments
	    keywords = {
	        FIX = {
	          icon = " ", -- icon used for the sign, and in search results
	          color = "error", -- can be a hex color, or a named color (see below)
	          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
	          -- signs = false, -- configure signs for some keywords individually
	        },
	        TODO = { icon = " ", color = "info" },
	        HACK = { icon = " ", color = "warning" },
	        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
	        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
	        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
	    },
	    merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	    -- highlighting of the line containing the todo comment
	    -- * before: highlights before the keyword (typically comment characters)
	    -- * keyword: highlights of the keyword
	    -- * after: highlights after the keyword (todo text)
	    highlight = {
	        before = "", -- "fg" or "bg" or empty
	        keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
	        after = "fg", -- "fg" or "bg" or empty
	        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
	        comments_only = true, -- uses treesitter to match keywords in comments only
	        max_line_len = 400, -- ignore lines longer than this
	        exclude = {}, -- list of file types to exclude highlighting
	    },
	    -- list of named colors where we try to extract the guifg from the
	    -- list of hilight groups or use the hex color if hl not found as a fallback
	    colors = {
	        error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
	        warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
	        info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
	        hint = { "LspDiagnosticsDefaultHint", "#10B981" },
	        default = { "Identifier", "#7C3AED" },
	    },
	    search = {
	        command = "rg",
	        args = {
	          	"--color=never",
	          	"--no-heading",
	          	"--with-filename",
	          	"--line-number",
	          	"--column",
	        },
	        -- regex that will be used to match keywords.
	        -- don't replace the (KEYWORDS) placeholder
	        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
	        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	    },
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
			h = {":Telescope help_tags<CR>", "Telescope healp"},   -- telescope help
			n = {":enew<CR>", "New File"},                         -- create a new empty buffer
			["1"] = "which_key_ignore",                            -- special label to hide it in the popup
		},
        c= {
            name = "comments",
            l = {":TodoLocList<CR>", "Use location list to show"},
            q = {":TodoQuickFix<CR>", "Use quickfix list to show"},
            t = {":TodoTrouble<CR>", "Use trouble list to show"},
            s = {":TodoTelescope<CR>", "Search with Telescope"},
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
        s = {":SymbolsOutline<CR>", "Symbols Outline"}, -- using Symbols Outline to realize tag bar
        t = {":TroubleToggle<CR>", "Trouble Toggle"}, -- show the trouble toggle
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

