local config = {}

function config.nvim_lsp() require("modules.completion.lspconfig") end

function config.luasnip()
    require("luasnip").config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI"
    }
    require("luasnip/loaders/from_vscode").load()
end

function config.cmp()
    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local cmp = require("cmp")
    cmp.setup {
        formatting = {
            format = function(entry, vim_item)
                local lspkind_icons = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "ﰠ",
                    Variable = "",
                    Class = "ﴯ",
                    Interface = "",
                    Module = "",
                    Property = "ﰠ",
                    Unit = "塞",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "פּ",
                    Event = "",
                    Operator = "",
                    TypeParameter = ""
                }
                -- load lspkind icons
                vim_item.kind = string.format("%s %s",
                                              lspkind_icons[vim_item.kind],
                                              vim_item.kind)

                vim_item.menu = ({
                    -- cmp_tabnine = "[TN]",
                    orgmode = "[ORG]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[Lua]",
                    buffer = "[BUF]",
                    path = "[PATH]",
                    tmux = "[TMUX]",
                    luasnip = "[SNIP]",
                    spell = "[SPELL]"
                })[entry.source.name]

                return vim_item
            end
        },
        -- You can set mappings if you want
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-e>"] = cmp.mapping.close(),
            ["<Tab>"] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t("<C-n>"), "n")
                else
                    fallback()
                end
            end,
            ["<S-Tab>"] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t("<C-p>"), "n")
                else
                    fallback()
                end
            end,
            ["<C-h>"] = function(fallback)
                if require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
                else
                    fallback()
                end
            end,
            ["<C-l>"] = function(fallback)
                if require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
                else
                    fallback()
                end
            end
        },

        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },

        -- You should specify your *installed* sources.
        sources = {
            {name = "nvim_lsp"},
            {name = "nvim_lua"},
            {name = "luasnip"},
            {name = "buffer"},
            {name = "path"},
            {name = "spell"},
            {name = "tmux"},
            {name = "orgmode"}
        }
    }
end

function config.coc()
	-- coc extensions
	vim.g.coc_global_extensions = {
		"coc-snippets",
		"coc-highlight",
		"coc-sh",
		-- "coc-pyright",
		"coc-markdownlint",
		"coc-cmake",
		"coc-clangd",
	}
end

return config

