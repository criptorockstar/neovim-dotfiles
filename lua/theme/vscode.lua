local M = {
	"askfiy/visual_studio_code",
	lazy = false,
}

local vscode_status_ok, vscode = pcall(require, "visual_studio_code")
if not vscode_status_ok then
	M.config = true
	return M
end

M.config = function()
	vscode.setup({
		mode = "dark",
		preset = true,
		transparent = true,
		expands = {
			hop = true,
			dbui = true,
			lazy = true,
			aerial = true,
			null_ls = true,
			nvim_cmp = true,
			gitsigns = true,
			which_key = true,
			nvim_tree = true,
			lspconfig = true,
			telescope = true,
			barbar = true,
			nvim_navic = true,
			nvim_notify = true,
			vim_illuminate = true,
			nvim_treesitter = true,
			nvim_ts_rainbow = true,
			nvim_scrollview = true,
			nvim_ts_rainbow2 = true,
			indent_blankline = true,
			vim_visual_multi = true,
		},
		hooks = {
			before = function(conf, colors, utils) end,
			after = function(conf, colors, utils) end,
		},
	})
end

return M
