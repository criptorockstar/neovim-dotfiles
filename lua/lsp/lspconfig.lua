local M = {
  "neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"folke/neodev.nvim",
	}
}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach = function(client, bufnr)
    -- keymap function
    local function keymap(mode, lhs, rhs, desc)
        local opts = { noremap = true, silent = true, buffer = bufnr, desc = desc }
        vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- keymaps
    keymap("n", "<leader>gg", "<cmd>Lspsaga lsp_finder<CR>", " LSP finder")
    keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", " Go to declaration")
    keymap("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", "󰆧 Go to definition")
    keymap("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "󰡱 Go to implementation")
    keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", " Code action")
    keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", "󰟵 Rename")
    keymap("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", " Line diagnostics")
    keymap("n", "<leader>D", "<cmd>Lspsaga show_cursor_diagnostics<CR>", " Cursor diagnostics")
    keymap("n", "[d", "<cmd>Lspsaga diagnostics_jump_prev<CR>", " Jump previous diagnostics")
    keymap("n", "]d", "<cmd>Lspsaga diagnostics_jump_next<CR>", " Jump next diagnostics")
    keymap("n", "<leader>o", "<cmd>Lspsaga hover_doc<CR>", "󰔢 LSP outline toggle")
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", " Show documentation")

    -- formatting
    if client.server.capabilities.documentFormattingProvider then
        vim.api.nvim_command([[augroup Format]])
        vim.api.nvim_command([[autocmd! * <buffer>]])
        vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
        vim.api.nvim_command([[augroup END]])
    end

    -- client actions
    if client.name == "tsserver" then
        keymap("n", "<leader>rf", ":TypescriptRenameFile<CR>", "󰟵 Typescript rename file")
    end
end

local lspconfig_status_ok, _ = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  M.config = function() end
  return M
end

M.config = function()
  require("neodev").setup()

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  })

  -- LSP servers -- 
  require('lsp/servers/lua').setup()
  require('lsp/servers/python').setup()
  require('lsp/servers/kotlin').setup()
end

return M
