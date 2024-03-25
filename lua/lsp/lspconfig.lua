return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	lazy = false,
	config = function()
		local lspconfig = require("lspconfig")

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local on_attach = function(client, bufnr)
			-- formatting
			if client.server.capabilities.documentFormattingProvider then
				vim.api.nvim_command([[augroup Format]])
				vim.api.nvim_command([[autocmd! * <buffer>]])
				vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
				vim.api.nvim_command([[augroup END]])
			end
		end

		-- Typescript
		lspconfig.tsserver.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
			cmd = { "typescript-language-server", "--stdio" },
		})

		-- Lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "use", "vim" },
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
	end,
}
