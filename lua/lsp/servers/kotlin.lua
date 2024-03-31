local M = {}

M.setup = function()
  require("lspconfig").kotlin_language_server.setup({
    capabilities = M.capabilities,
    on_attach = M.on_attach,
    filetypes = { "kotlin" }
  })
end

return M
