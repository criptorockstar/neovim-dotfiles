local M = {}

M.setup = function()
	require("lspconfig").lua_ls.setup({
		capabilities = M.capabilities,
		on_attach = M.on_attach,
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
