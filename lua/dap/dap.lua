local M = {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
}

M.config = function()
	local dap = require("dap")

	dap.configurations.python = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",

			pythonPath = function()
				-- Use pyenv
				local pyenv_python = os.getenv("PYENV_ROOT") .. "/shims/python"
				if vim.fn.executable(pyenv_python) == 1 then
					return pyenv_python
				else
					-- Fallback to system Python if pyenv is not found
					return "/usr/bin/python"
				end
			end,
		},
	}
end

return M
