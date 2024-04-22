local M = {
	"catppuccin/nvim",
	name = "catppuccin",
}

M.config = function()
	require("catppuccin").setup({
	  flavour = "mocha",
    transparent_background = true,
    term_colors = false,
    show_end_of_buffer = true
	})
end

return M
