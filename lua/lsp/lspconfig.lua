local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
}

M.config = function()
	-- handlers
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = true,
	})

	local util = require("lspconfig.util")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local on_attach = function(client, buffnr)
		local function map(mode, lhs, rhs, desc)
			local opts = { buffer = buffnr, silent = true, desc = desc }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		map("n", "<leader>gg", "<cmd>Lspsaga lsp_finder<CR>", " LSP finder")
		map("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", " Go to declaration")
		map("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", "󰆧 Go to definition")
		map("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "󰡱 Go to implementation")
		map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", " Code action ")
		map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "󰟵 Rename")
		map("n", "<leader>w", "<cmd>Lspsaga show_line_diagnostics<CR>", " Line diagnostics")
		map("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics()<CR>", " Cursor diagnostics")
		map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", " Jump previous diagnostics")
		map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", " Jump next diagnostics")
		map("n", "<leader>o", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "󰔢 LSP signature")
		map("n", "K", "<cmd>Lspsaga hover_doc<CR>", " Show documentation")

		-- client actions
		if client.name == "tsserver" then
			map("n", "<leader>rf", ":TypescriptRenameFile<CR>", "󰟵 Typescript rename file")
		end
	end

	-- Lua
	require("lspconfig").lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
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

	-- Python
	local python_root_files = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	}

	local function organize_imports()
		local params = {
			command = "pyright.organizeimports",
			arguments = { vim.uri_from_bufnr(0) },
		}

		local clients = vim.lsp.get_active_clients({
			bufnr = vim.api.nvim_get_current_buf(),
			name = "pyright",
		})
		for _, client in ipairs(clients) do
			client.request("workspace/executeCommand", params, nil, 0)
		end
	end

	local function set_python_path(path)
		local clients = vim.lsp.get_active_clients({
			bufnr = vim.api.nvim_get_current_buf(),
			name = "pyright",
		})
		for _, client in ipairs(clients) do
			if client.settings then
				client.settings.python =
					vim.tbl_deep_extend("force", client.settings.python or {}, { pythonPath = path })
			else
				client.config.settings =
					vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = path } })
			end
			client.notify("workspace/didChangeConfiguration", { settings = nil })
		end
	end

	require("lspconfig").pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		default_config = {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_dir = function(fname)
				return util.root_pattern(unpack(python_root_files))(fname)
			end,
			single_file_support = true,
			settings = {
				pyright = {
					extraPaths = "~/.config",
					reportReturnType = "error",
					reportMissingTypeArgument = "error",
					reportOptionalMemberAccess = "none",
					reportOptionalIterable = "none",
					reportDuplicateImport = "error",
					analyzeUnannotatedFunctions = true,
					reportUntypedFunctionDecorator = "error",
					reportPrivateUsage = "error",
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "openFilesOnly",
					},
				},
			},
		},
		commands = {
			PyrightOrganizeImports = {
				organize_imports,
				description = "Organize Imports",
			},
			PyrightSetPythonPath = {
				set_python_path,
				description = "Reconfigure pyright with the provided python path",
				nargs = 1,
				complete = "file",
			},
		},
		docs = {
			description = [[
        https://detachhead.github.io/pyright

        `pyright`, a static type checker and language server for python
      ]],
		},
	})

	-- Solidity
	local solidity_root_files = {
		"hardhat.config.js",
		"hardhat.config.ts",
		"foundry.toml",
		"remappings.txt",
		"truffle.js",
		"truffle-config.js",
		"ape-config.yaml",
	}

	require("lspconfig").solidity_ls_nomicfoundation.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		default_config = {
			cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
			filetypes = { "solidity" },
			root_dir = util.root_pattern(unpack(solidity_root_files)) or util.root_pattern(".git", "package.json"),
			single_file_support = true,
		},
		docs = {
			description = [[
        https://github.com/NomicFoundation/hardhat-vscode/blob/development/server/README.md

        `nomicfoundation-solidity-language-server` can be installed via `npm`:

        ```sh
        npm install -g @nomicfoundation/solidity-language-server
        ```

        A language server for the Solidity programming language,
        built by the Nomic Foundation for the Ethereum community.
      ]],
			default_config = {
				root_dir = [[root_pattern("]]
					.. table.concat(solidity_root_files, '", "')
					.. [[", ".git", "package.json")]],
			},
		},
	})

	-- Typescript | Javascript
	require("lspconfig").tsserver.setup({
		default_config = {
			init_options = { hostInfo = "neovim" },
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
				"jsconfig.json",
				"package.json",
			},
			root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
			single_file_support = true,
		},
		docs = {
			description = [[
        https://github.com/typescript-language-server/typescript-language-server

        `typescript-language-server` depends on `typescript`. Both packages can be installed via `npm`:
        ```sh
        npm install -g typescript typescript-language-server
        ```

        To configure typescript language server, add a
        [`tsconfig.json`](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html) or
        [`jsconfig.json`](https://code.visualstudio.com/docs/languages/jsconfig) to the root of your
        project.

        Here's an example that disables type checking in JavaScript files.

        ```json
        {
          "compilerOptions": {
            "module": "commonjs",
            "target": "es6",
            "checkJs": false
          },
          "exclude": [
            "node_modules"
          ]
        }
        ```

        ### Vue support

        As of 2.0.0, Volar no longer supports TypeScript itself. Instead, a plugin
        adds Vue support to this language server.

        *IMPORTANT*: It is crucial to ensure that `@vue/typescript-plugin` and `volar `are of identical versions.

        ```lua
        require'lspconfig'.tsserver.setup{
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                languages = {"javascript", "typescript", "vue"},
              },
            },
          },
          filetypes = {
            "javascript",
            "typescript",
            "vue",
          },
        }

        -- You must make sure volar is setup
        -- e.g. require'lspconfig'.volar.setup{}
        -- See volar's section for more information
        ```

        `location` MUST be defined. If the plugin is installed in `node_modules`,
        `location` can have any value.

        `languages` must include `vue` even if it is listed in `filetypes`.

        `filetypes` is extended here to include Vue SFC.
      ]],
			default_config = {
				root_dir = [[root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")]],
			},
		},
	})
end

return M
