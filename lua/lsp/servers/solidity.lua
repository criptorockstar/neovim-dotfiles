local M = {}

local root_files = {
	"hardhat.config.js",
	"hardhat.config.ts",
	"foundry.toml",
	"remappings.txt",
	"truffle.js",
	"truffle-config.js",
	"ape-config.yaml",
}

local capabilities = require("lsp/lspconfig").capabilities
local on_attach = require("lsp/lspconfig").on_attach
local util = require("lspconfig.util")

M.setup = function()
	require("lspconfig").solidity_ls_nomicfoundation.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		default_config = {
			cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
			filetypes = { "solidity" },
			root_dir = util.root_pattern(unpack(root_files)) or util.root_pattern(".git", "package.json"),
			single_file_support = true,
			settings = {
				-- Configura la indentación a 4 espacios
				solidity = {
					settings = {
						-- Configura la indentación a 4 espacios
						editor = {
							tabSize = 4,
						},
					},
				},
			},
		},
		docs = {
			description = [[
        https://github.com/NomicFoundation/hardhat-vscode/blob/development/server/README.md

        `nomicfoundation-solidity-language-server` can be installed via `npm`:

        ```sh
        npm install -g @nomicfoundation/solidity-language-server
        ```

        A language server for the Solidity programming language, built by the Nomic Foundation for the Ethereum community.
      ]],
			default_config = {
				root_dir = [[root_pattern("]] .. table.concat(root_files, '", "') .. [[", ".git", "package.json")]],
			},
		},
	})
end

return M
