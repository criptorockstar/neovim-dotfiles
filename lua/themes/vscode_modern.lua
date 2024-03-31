local M = {
  "gmr458/vscode_modern_theme.nvim",
  lazy = false,
}

local vscode_status_ok, vscode = pcall(require, "vscode_modern")
if not vscode_status_ok then
  M.config = true
  return M
end

M.config = function()
  vscode.setup({
    cursorline = true,
    transparent_background = false,
    nvim_tree_darker = true,
  })
end

return M
