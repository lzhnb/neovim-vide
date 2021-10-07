local config = {}

function config.nvim_tree()
	-- following options are the default
	require("nvim-tree").setup {
		quit_on_open = true, -- closes the tree when you open a file
        tree_indent_markers = true, -- this option shows indent markers when folders are open
        tree_hide_dotfiles = true, -- this option hides files and folders starting with a dot
        highlight_opened_files = true, -- will enable folder and file icon highlight for opened files/directories.
        root_folder_modifier = ":~", -- This is the default. See :help filename-modifiers for more options
        add_trailing = true, -- append a trailing slash to folder names
        group_empty = true, -- compact folders that only contain a single folder into one node in the file tree
        disable_window_picker = true, -- will disable the window picker.
        icon_padding = " ", -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
        symlink_arrow = " >> ", -- defaults to ' ➛ '. used as a separator between symlinks' source and target.
        respect_buf_cwd = true, -- will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
        create_in_closed_folder = false, -- When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
        refresh_wait = 500, -- 1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
        window_picker_exclude = {
            filetype = {"notify", "packer", "qf"},
            buftype = {"terminal"},
        },
        disable_netrw = true, -- disables netrw completel
		hijack_netrw = true, -- hijack netrw window on startup
		open_on_setup = false, -- open the tree when running this setup function
        ignore = {".git", "node_modules", ".cache"}, -- empty by default
        gitignore = true,
        git_hl = true,
		ignore_ft_on_setup = {"startify", "dashboard"}, -- will not open on setup if the filetype is in this list
		auto_close = false, -- closes neovim automatically when the tree is the last **WINDOW** in the view
		open_on_tab = true, -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
		hijack_cursor = false, -- hijack the cursor in the tree to put it at the start of the filename
		update_cwd = true, -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
		lsp_diagnostics = false, -- show lsp diagnostics in the signcolumn
		-- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
		update_focused_file = {
			enable = true, -- enables the feature
			-- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
			-- only relevant when `update_focused_file.enable` is true
			update_cwd = true,
			-- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
			-- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
			ignore_list = {}
		},
		-- configuration options for the system open command (`s` in the tree by default)
		system_open = {
			cmd = nil, -- the command to run this, leaving nil should work in most cases
			args = {} -- the command arguments as a list
		},

		view = {
			width = 30, -- width of the window, can be either a number (columns) or a string in `%`
			side = "left", -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
			auto_resize = false, -- if true the tree will resize itself after opening a file
			mappings = {
				-- custom only false will merge the list with the default mappings
				-- if true, it will only use your list to set the mappings
				custom_only = false,
				list = {} -- list of mappings to set on the tree manually
			}
		}
	}
end

function config.lualine()
	require("lualine").setup {
		options = {
			theme = "onedark",
			icons_enabled = true,
			disableed_filetypes = {},
		},
		sections = {
			lualine_a = {"mode", "vim.o.paste"},
			lualine_b = {
				{"branch"},
				{"diff"},
				{"vim.b.vista_nearest_method_or_function"},
			},
            lualine_c = {"filename"},
			lualine_y = {"progress"},
			lualine_z = {"location"}
    	},
    	inactive_sections = {
        	lualine_a = {},
        	lualine_b = {},
        	lualine_c = {"filename"},
        	lualine_x = {"location"},
        	lualine_y = {},
        	lualine_z = {}
    	},
   		tabline = {},
    	extensions = {}
	}
end

function config.bufferline()
    require("bufferline").setup {
        options = {
            modified_icon = "✥",
            buffer_close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 14,
            max_prefix_length = 13,
            tab_size = 20,
            show_buffer_close_icons = true,
            show_buffer_icons = true,
            show_tab_indicators = true,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            separator_style = "slant",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    padding = 1
                }
            }
        }
    }
end

function config.gitsigns()
    if not packer_plugins["plenary.nvim"].loaded then
        vim.cmd [[packadd plenary.nvim]]
    end
    require("gitsigns").setup {
        signs = {
            add = {hl = "GitGutterAdd", text = "▋"},
            change = {hl = "GitGutterChange", text = "▋"},
            delete = {hl = "GitGutterDelete", text = "▋"},
            topdelete = {hl = "GitGutterDeleteChange", text = "▔"},
            changedelete = {hl = "GitGutterChange", text = "▎"}
        },
        watch_gitdir = {interval = 1000, follow_files = true},
        current_line_blame = true,
        current_line_blame_opts = {delay = 500, virtual_text_pos = "eol"},
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        word_diff = false,
        diff_opts = {internal = true}
    }
end

function config.dashboard()
    vim.g.dashboard_default_executive = "telescope"
    vim.g.dashboard_custom_section = {
        find_frecency = {
            description = {" File frecency              comma f r "},
            command = "Telescope frecency"
        },
        find_history = {
            description = {" File history               comma f e "},
            command = "Telescope find_files"
        },
        find_project = {
            description = {" Project find               comma f p "},
            command = "Telescope project"
        },
        find_file = {
            description = {" File find                  comma f f "},
            command = "Telescope find_files"
        },
        file_new = {
            description = {" File new                   comma f n "},
            command = "DashboardNewFile"
        },
        find_word = {
            description = {" Word find                  comma f w "},
            command = "Telescope live_grep"
        }
    }
end

return config

