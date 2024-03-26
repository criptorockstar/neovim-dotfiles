return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	lazy = false,
	config = function()
		local lspconfig = require("lspconfig")

		local signs = { Error = "󰃤 ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local on_attach = function(client, _) --bufnr
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

		lspconfig.kotlin_language_server.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "kotlin" },
			cmd = { "kotlin-language-server", "--stdio" },
		})

		-- Lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
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
							[vim.fn.expand("$vimruntime/lua/vim/lsp")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
						checkThirdParty = false,
					},
				},
			},
		})

		function PrintDiagnostics(opts, bufnr, line_nr, _)
			bufnr = bufnr or 0
			line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
			opts = opts or { ["lnum"] = line_nr }

			local line_diagnostics = vim.diagnostic.get(bufnr, opts)
			if vim.tbl_isempty(line_diagnostics) then
				return
			end

			local diagnostic_message = ""
			for i, diagnostic in ipairs(line_diagnostics) do
				diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
				print(diagnostic_message)
				if i ~= #line_diagnostics then
					diagnostic_message = diagnostic_message .. "\n"
				end
			end
			vim.api.nvim_echo({ { diagnostic_message, "Normal" } }, false, {})
		end
		vim.cmd([[ autocmd! CursorHold * lua PrintDiagnostics() ]])
	end,
}
