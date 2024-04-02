local M = {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("barbar").setup({
			animation = true,
			auto_hide = false,
			tabpages = true,
			clickable = true,
			focus_on_close = "left",
			highlight_alternate = false,
			highlight_inactive_file_icons = false,
			highlight_visible = false,
			separator_at_end = false,
			preset = "default",
			icons = {
				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
					[vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
					[vim.diagnostic.severity.INFO] = { enabled = true, icon = " " },
					[vim.diagnostic.severity.HINT] = { enabled = true, icon = " " },
				},
			},
			sidebar_filetypes = {
				NvimTree = true,
				undotree = {
					text = "undotree",
					align = "center",
				},
				["neo-tree"] = { event = "BufWipeout" },
				Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
			},
		})
	end,
}

return M
