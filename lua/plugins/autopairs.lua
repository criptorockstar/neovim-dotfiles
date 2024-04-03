local M = {
	"windwp/nvim-autopairs",
	lazy = false,
}

M.config = function()
	require("nvim-autopairs").setup({
		disable_filetype = { "TelescopePrompt", "vim" },
	})
end

return M
