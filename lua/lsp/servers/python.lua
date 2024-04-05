local M = {}

local root_files = {
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
			client.settings.python = vim.tbl_deep_extend("force", client.settings.python, { pythonPath = path })
		else
			client.config.settings =
				vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = path } })
		end
		client.notify("workspace/didChangeConfiguration", { settings = nil })
	end
end

local capabilities = require("lsp/lspconfig").capabilities
local on_attach = require("lsp/lspconfig").on_attach
local util = require("lspconfig.util")

M.setup = function()
	require("lspconfig").pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		default_config = {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_dir = function(fname)
				return util.root_pattern(unpack(root_files))(fname)
			end,
			single_file_support = true,
			settings = {
				pyright = {
					reportMissingImports = true,
					reportMissingTypeStubs = false,
					reportPrivateImportUsage = false,
					reportOptionalMemberAccess = false,
					reportArgumentType = false,
					exclude = { "**/__init__.py" },
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
      https://github.com/microsoft/pyright

      `pyright`, a static type checker and language server for python
    ]],
		},
	})
end

return M
