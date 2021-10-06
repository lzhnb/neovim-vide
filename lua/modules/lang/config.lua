local config = {}

function config.nvim_treesitter()
    vim.api.nvim_command("set foldmethod=manual")
  	-- auto fold the code
    -- vim.api.nvim_command("set foldmethod=expr")
  	-- vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
  	require("nvim-treesitter.configs").setup {
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
        	"cpp",
        	"json",
        	"lua",
        	"yaml"
    	},
  	}
end

function config.jedi_vim()
   -- disable autocompletion, cause we use deoplete for completion
	vim.g["jedi#completions_enabled"] = 0
	-- open the got-to function in split, not another buffer
	vim.g["jedi#use_splits_not_buffers"] = "right" 
end

return config


