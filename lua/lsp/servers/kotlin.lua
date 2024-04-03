local M = {}

local bin_name = "kotlin-language-server"
if vim.fn.has("win32") == 1 then
	bin_name = bin_name .. ".bat"
end

local root_files = {
	"settings.gradle", -- Gradle (multi-project)
	"settings.gradle.kts", -- Gradle (multi-project)
	"build.xml", -- Ant
	"pom.xml", -- Maven
	"build.gradle", -- Gradle
	"build.gradle.kts", -- Gradle
}

local capabilities = require("lsp/lspconfig").capabilities
local on_attach = require("lsp/lspconfig").on_attach
local util = require("lspconfig.util")

M.setup = function()
	require("lspconfig").kotlin_language_server.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		default_config = {
			filetypes = { "kotlin" },
			root_dir = util.root_pattern(unpack(root_files)),
			cmd = { bin_name },
			init_options = {
				storagePath = util.root_pattern(unpack(root_files))(vim.fn.expand("%:p:h")),
			},
		},
		docs = {
			description = [[
        A kotlin language server which was developed for internal usage and
        released afterwards. Maintaining is not done by the original author,
        but by fwcd.

        It is built via gradle and developed on github.
        Source and additional description:
        https://github.com/fwcd/kotlin-language-server

        This server requires vim to be aware of the kotlin-filetype.
        You could refer for this capability to:
        https://github.com/udalov/kotlin-vim (recommended)
        Note that there is no LICENSE specified yet.

        For faster startup, you can setup caching by specifying a storagePath
        in the init_options. The default is your home directory.
      ]],
			default_config = {
				root_dir = [[See source]],
				cmd = { "kotlin-language-server" },
				init_options = {
					storagePath = [[Enables caching and use project root to store cache data. See source]],
				},
			},
		},
	})
end

return M
