local M = {
  "windwp/nvim-ts-autotag",
	lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  }
}

local autotag_status_ok, autotags = pcall(require, "nvim-ts-autotag")
if not autotag_status_ok then
  M.config = true
  return M
end

M.config = function()
  autotag.setup({})
end

return M
