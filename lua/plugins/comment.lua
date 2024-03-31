local M = {
	"numToStr/Comment.nvim",
	lazy = false,
}

M.config = function()
	require("Comment").setup()
end

return M
