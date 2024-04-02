local M = {
  "windwp/nvim-ts-autotag",
	lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  }
}

M.config = function()
  require("nvim-ts-autotag").setup({})
end

return M
