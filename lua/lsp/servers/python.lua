local M = {}

M.setup = function()
	local capabilities = require("lsp/lspconfig").capabilities
	local on_attach = require("lsp/lspconfig").on_attach

	require("lspconfig").pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		default_config = {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			settings = {
				pyright = {
					reportMissingImports = true,
					reportMissingTypeStubs = false,
					reportPrivateImportUsage = false,
					reportOptionalMemberAccess = false,
					reportArgumentType = false,
				},
				python = {
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "openFilesOnly",
					},
				},
			},
		},
	})
end

return M
