local M = {
	"nvim-tree/nvim-tree.lua",
}

M.config = function()
	require("nvim-tree").setup({
		filters = {
			dotfiles = false,
		},
		hijack_netrw = true,
		hijack_cursor = true,
		auto_reload_on_write = true,
		disable_netrw = true,
		hijack_unnamed_buffer_when_opening = false,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		view = {
			adaptive_size = false,
			side = "left",
			cursorline = true,
			width = 30,
			preserve_window_proportions = true,
			signcolumn = "yes",
		},
		git = {
			enable = true,
			ignore = true,
		},
		filesystem_watchers = {
			enable = true,
		},
		actions = {
			open_file = {
				resize_window = true,
			},
		},
		renderer = {
			root_folder_label = false,
			highlight_opened_files = "none",
			highlight_modified = "icon",
			highlight_git = "icon",
			highlight_diagnostics = "icon",
			special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
			indent_markers = {
				enable = false,
			},
			icons = {
				web_devicons = {
					file = {
						enable = true,
						color = true,
					},
					folder = {
						enable = false,
						color = true,
					},
				},
				git_placement = "before",
				modified_placement = "after",
				diagnostics_placement = "signcolumn",
				bookmarks_placement = "signcolumn",
				padding = " ",
				symlink_arrow = " ➛ ",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
					modified = true,
					diagnostics = true,
				},
				glyphs = {
					default = "󰈚",
					symlink = "",
					modified = "●",
					folder = {
						default = "",
						empty = "",
						empty_open = "",
						open = "",
						symlink = "",
						symlink_open = "",
						arrow_open = "",
						arrow_closed = "",
					},
					git = {
						unstaged = "󰄱",
						staged = "",
						unmerged = "",
						renamed = "󰁕",
						untracked = "",
						deleted = "✖",
						ignored = "",
					},
				},
			},
		},
		diagnostics = {
			enable = false,
			show_on_dirs = false,
			show_on_open_dirs = true,
			debounce_delay = 50,
			severity = {
				min = vim.diagnostic.severity.HINT,
				max = vim.diagnostic.severity.ERROR,
			},
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
	})
end

return M
