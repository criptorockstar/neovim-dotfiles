local M = {
	"Mofiqul/vscode.nvim",
}

M.config = function()
	local c = require("vscode.colors").get_colors()
	require("vscode").setup({})
	require("vscode").load("dark")
end

return M
