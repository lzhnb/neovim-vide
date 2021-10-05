local config = {}

function config.coc()
	-- coc extensions
	vim.g.coc_global_extensions = {
		"coc-snippets",
		"coc-highlight",
		"coc-git",
		"coc-yaml",
		"coc-sh",
		"coc-pyright",
		"coc-markdownlint",
		"coc-json",
		"coc-cmake",
		"coc-clangd",
	}
end

return config

