local M = {
	"shellRaining/hlchunk.nvim",
	event = { "UIEnter" },
}

M.config = function()
	require("hlchunk").setup({
		chunk = {
			chars = {
				horizontal_line = "─",
				vertical_line = "│",
				left_top = "╭",
				left_bottom = "╰",
				right_arrow = "",
			},
			style = "#806d9c",
		},
		line_num = {
			enable = true,
			support_filetypes = {
				"...",
			},
			style = "#806d9c",
		},
		blank = {
			enable = false,
			chars = {
				"",
			},
			style = {
				vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
			},
			exclude_filetype = "...",
		},
	})
end

return M
