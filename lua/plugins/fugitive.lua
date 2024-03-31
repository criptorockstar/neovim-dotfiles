local opts = { noremap = true, silent = true }

local function options(desc)
	return vim.tbl_extend("force", opts, { desc = desc })
end

local M = {
	"tpope/vim-fugitive",
	lazy = "VeryLazy",
	cmd = { "G", "Git" },
	keys = {
		{ "<leader>ga", ":Git fetch --all -p<CR>", options("Git fetch") },
		{ "<leader>gl", ":Git pull<CR", options("Git pull") },
	},
}

return M
