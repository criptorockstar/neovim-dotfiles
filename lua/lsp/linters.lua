local M = {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
}

M.config = function()
	local lint = require("lint")

	lint.linters_by_ft = {
		lua = { "luacheck" },
		python = { "flake8" },
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		svelte = { "eslint_d" },
		css = { "eslint_d" },
		html = { "eslint_d" },
		json = { "eslint_d" },
		yaml = { "eslint_d" },
		markdown = { "eslint_d" },
		graphql = { "eslint_d" },
		solidity = { "solhint" },
	}

	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})
end

return M
