local M = {}

local capabilities = require("lsp/lspconfig").capabilities
local on_attach = require("lsp/lspconfig").on_attach

M.setup = function()
	require("lspconfig").lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
					disable = { "missing-fields" },
				},
				hint = {
					enable = true,
				},
				telemetry = {
					enable = false,
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
					checkThirdParty = false,
				},
			},
		},
	})
end

return M
