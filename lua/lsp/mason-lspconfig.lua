local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

M.config = function()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"tsserver",
			"html",
			"tailwindcss",
			"lua_ls",
			"emmet_ls",
			"prismals",
			"pyright",
			"angularls",
			"arduino_language_server",
			"astro",
			"autotools_ls",
			"bashls",
			"clangd",
			"omnisharp",
			"cairo_ls",
			"cmake",
			"cssls",
			"denols",
			"dockerls",
			"gradle_ls",
			"graphql",
			"jsonls",
			"quick_lint_js",
			"kotlin_language_server",
			"texlab",
			"marksman",
			"matlab_ls",
			"move_analyzer",
			"mutt_ls",
			"intelephense",
			"perlnavigator",
			"rubocop",
			"somesass_ls",
			"theme_check",
			"solidity_ls_nomicfoundation",
			"yamlls",
		},
		automatic_installation = false,
	})
end

return M
