local M = {}

M.setup = function()
  require("lspconfig").pyright.setup({
    capabilities = M.capabilities,
    on_attach = M.on_attach,
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
      }
    }
  })
end

return M
