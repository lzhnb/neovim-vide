-- load lsp config
if not packer_plugins["nvim-lspconfig"].loaded then
    vim.cmd [[packadd nvim-lspconfig]]
end

if not packer_plugins["nvim-lspinstall"].loaded then
    vim.cmd [[packadd nvim-lspinstall]]
end

local nvim_lsp = require("lspconfig")
local lsp_install = require("lspinstall")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.documentationFormat = {
    "markdown", "plaintext"
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = {
    valueSet = {1}
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}

local function setup_servers()
  	lsp_install.setup()
  	local servers = lsp_install.installed_servers()
  	for _, server in pairs(servers) do
    	nvim_lsp[server].setup{}
  	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don"t have to restart neovim
lsp_install.post_install_hook = function ()
  	setup_servers() -- reload installed servers
  	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


