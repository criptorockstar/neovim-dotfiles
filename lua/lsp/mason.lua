return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	cmd = "Mason",
	event = "BufReadPre",
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls", -- lua language server
				"cairo_ls", -- cairo language server
				"tsserver", -- typescript language server
			},
			automatic_installation = false,
			handlers = nil,
		})

		local mason_tool_installer = require("mason-tool-installer")

		mason_tool_installer.setup({
			ensure_installed = {
				"luacheck", -- lua linter
				"stylua", -- lua formatter
				"prettier", -- prettier formatter
				"isort", -- python formatter
				"black", -- python formatter
				"flake8", -- python linter
				"eslint_d", -- js linter
			},
		})
	end,
}
