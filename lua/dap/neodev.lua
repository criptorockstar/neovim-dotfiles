local M = {
	"folke/neodev.nvim",
	opts = {},
}

M.config = function()
	require("neodev").setup({
		library = {
			enabled = true,
			plugins = {
				"nvim-dap-ui",
			},
			types = true,
		},
	})
end

return M
