local M = {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap-python",
	},
	event = "VeryLazy",
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ "<leader>vs", "<cmd>VenvSelect<cr>" },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
	},
}

M.config = function()
	require("venv-selector").setup({
		name = "pyenv",
		pyenv_path = "~/.pyenv/versions",
		auto_refresh = false,
	})
end

return M
