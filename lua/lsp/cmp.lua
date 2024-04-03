local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		"onsails/lspkind-nvim",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	lazy = false,
}

local lsp_icons = {
	Class = "󰠱",
	Color = "󰏘",
	Constant = "󰐀",
	Constructor = "⌘",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "󰜢",
	File = "󰈙",
	Folder = "",
	Function = "󰊕",
	Interface = "",
	Keyword = "󰔌",
	Method = "󰆧",
	Module = "󰏓",
	Operator = "󰆕",
	Property = "󰜢",
	Reference = "󰈇",
	Snippet = "󰅱",
	Struct = "󰙅",
	Text = "",
	TypeParameter = "",
	Unit = "󰑭",
	Value = "󰎠",
	Variable = "󰈜",
}

M.config = function()
	local luasnip = require("luasnip")
	local cmp = require("cmp")

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "path", priority = 20 },
			{ name = "greek" },
			{ name = "luasnip", priority = 10, keyword_length = 1 },
			{ name = "buffer", option = { keyword_pattern = [[\k\+]] }, keyword_length = 1 },
			{ name = "codeium" },
		},
		enabled = function()
			local in_prompt = vim.api.nvim_buf_get_option(0, "buftype") == "prompt"
			if in_prompt or vim.bo.filetype == "TelescopePrompt" then
				return false
			end
			local context = require("cmp.config.context")
			return not (context.in_treesitter_capture("comment") or context.in_syntax_group("Comment"))
		end,
		experimental = {
			ghost_text = {},
		},
		completion = {
			border = "rounded",
			scrollbar = "║",
			keyword_pattern = [[\k\+]],
		},
		--window = {
		--  completion = cmp.config.window.bordered(),
		--  documentation = cmp.config.window.bordered(),
		--},
		mapping = {
			-- mostly keep defaults except use <C-f> instead <C-y>
			-- and overload tab keys for snippet plugins
			["<C-f>"] = cmp.mapping(
				cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				{ "i", "s" }
			),
			["<Tab>"] = cmp.mapping(function(fallback)
				if luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, {
				"i",
				"s", --[[ "c" (to enable the mapping in command mode) ]]
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s", --[[ "c" (to enable the mapping in command mode) ]]
			}),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete()),
			["<C-j>"] = cmp.mapping(function(fallback)
				if luasnip.choice_active() and luasnip.expand_or_locally_jumpable() then
					luasnip.change_choice(1)
				elseif cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-k>"] = cmp.mapping(function(fallback)
				if luasnip.choice_active() and luasnip.expand_or_locally_jumpable() then
					luasnip.change_choice(-1)
				elseif cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		sorting = {
			comparators = {
				function(...)
					return require("cmp_buffer"):compare_locality(...)
				end,
			},
		},
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = function(_, vim_item)
				vim_item.menu = vim_item.kind
				vim_item.kind = lsp_icons[vim_item.kind]
				return vim_item
			end,
		},
	})
end

return M
