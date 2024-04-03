local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
}

M.config = function()
	require("neo-tree").setup({
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		enable_normal_mode_for_inputs = false,
		open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
		default_component_configs = {
			auto_clean_after_session_restore = false,
			indent = {
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
		},
		window = {
			position = "left",
			width = 33,
		},
		event_handlers = {
			{
				event = "neo_tree_popup_input_ready",
				---@param args { bufnr: integer, winid: integer }
				handler = function(args)
					vim.cmd("stopinsert")
					vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
				end,
			},
		},
	})
end

return M
