local M = {}

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")

local capabilities = require("lsp/lspconfig").capabilities
local on_attach = require("lsp/lspconfig").on_attach

-- Need to run this manually on the terminal:
-- npm install -g mo-ide

M.setup = function()
	configs.motoko = {
		default_config = {
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "mo-ide", "--stdio" },
			settings = {},
			filetypes = { "*.mo" },
		},
	}
	lspconfig.motoko.setup({})
end

return M
