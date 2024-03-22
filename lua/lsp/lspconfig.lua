return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local lspconfig = require("lspconfig")

    local protocol = require("vim.lsp.protocol")

    local on_attach = function(client, bufnr)
      -- formatting
      if client.server.capabilities.documentFormattingProvider then
          vim.api.nvim_command [[augroup Format]]
          vim.api.nvim_command [[autocmd! * <buffer>]]
          vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
          vim.api.nvim_command [[augroup END]]
      end
    end

    lspconfig.tsserver.setup({
      on_attach = on_attach,
      filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      cmd = { "typescript-language-server", "--stdio" }
    })

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "use", "vim" }
          },
          hint = {
            enable = true,
            setType = true,
          },
          telemetry = {
            enable = false,
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
            checkThirdParty = false,
          }
        }
      }
    })
  end,
}
