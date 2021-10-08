local config = {}

function config.nvim_treesitter()
	local present, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
    if not present then
        print("can not load the nvim_treesitter")
        return
    end
  	-- auto fold the code
    -- vim.api.nvim_command("set foldmethod=expr")
  	-- vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
  	nvim_treesitter_configs.setup {
    	ensure_installed = "maintained",
    	highlight = {
      		enable = true,
    	},
    	textobjects = {
      		select = {
        		enable = true,
       	 		keymaps = {
          			["af"] = "@function.outer",
			  		["if"] = "@function.inner",
			  		["ac"] = "@class.outer",
			  		["ic"] = "@class.inner",
        		},
      		},
    	},
		ensure_installed = {
        	"bash",
        	"python",
        	"lua",
        	"cpp",
        	"json",
        	"yaml"
    	},
        rainbow = {
            enable = true,
            extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
            max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
        },
        context_commentstring = {enable = true, enable_autocmd = false},
        matchup = {enable = true},
        context = {enable = true, throttle = true}
    }
end

return config


