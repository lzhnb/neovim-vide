-- bootstrap
local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print("clonging packer into"..install_path)
    vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "git@github.com:wbthomason/packer.nvim.git",
        install_path
    })
    vim.cmd("packadd packer.nvim")
end

-- initialize packer loader(class)
local data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
local plugin_loader = {}
function plugin_loader:init()
  	local packer_ok, packer = pcall(require, "packer")
  	if not packer_ok then
    	return
  	end

    local packer_compiled = data_dir.."packer_compiled.vim"
    packer.init({
        compile_path = packer_compiled,
        git = {clone_timeout = 120},
        disable_commands = true
    })
    packer.reset()
    local use = packer.use

  	self.packer = packer
  	return self
end

local vim_path = vim.fn.stdpath("config")
local modules_dir = vim_path.."/lua/modules"

function plugin_loader:load(plugins)
  	return self.packer.startup(
		function(use)
      		for _, plugin in ipairs(plugins) do
        		use(plugin)
      		end
		end
	)
end

local plugins = {
    {"wbthomason/packer.nvim"},
    {"navarasu/onedark.nvim"},
    {"kyazdani42/nvim-web-devicons"},
    {
        "hoob3rt/lualine.nvim",
        disable = false,
    },
    {
        "romgrk/barbar.nvim",
        event = "BufWinEnter",
        disable = false,
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        opt = true,
        config = function() require('telescope').setup {} end,
    },
    {"folke/which-key.nvim"},
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    },
    {
        "neoclide/coc.nvim",
        branch="release"
    },
    {"nvim-lua/plenary.nvim"},
    {"tpope/vim-commentary"},
    {"davidhalter/jedi-vim"},
    {"kyazdani42/nvim-tree.lua"},
    {"liuchengxu/vista.vim"}
}

plugin_loader:init()
plugin_loader:load(plugins)


