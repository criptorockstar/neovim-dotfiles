-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Current line number color
vim.api.nvim_command("augroup CursorLineHighlight")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd BufWinEnter,BufReadPost * highlight CursorLineNr guifg=yellow")
vim.api.nvim_command("augroup END")

-- Set dinamic tabwidth
vim.api.nvim_command("augroup DynamicTabwidth")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd BufEnter,BufReadPost *.sol setlocal tabstop=4 shiftwidth=4 expandtab")
vim.api.nvim_command("augroup END")

-- Diagnostic settings
vim.diagnostic.config({
	virtual_text = {
		source = true,
		format = nil,
	},
	underline = true,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌶 ", texthl = "DiagnosticSignHint" })

-- Set Icons
vim.api.nvim_call_function(
	"sign_define",
	{ "DapBreakpoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
	"sign_define",
	{ "DapBreakpointCondition", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
	"sign_define",
	{ "DapLogPoint", { linehl = "", text = "", texthl = "diffRemoved", numhl = "" } }
)

vim.api.nvim_call_function(
	"sign_define",
	{ "DapStopped", { linehl = "GitSignsChangeVirtLn", text = "", texthl = "diffChanged", numhl = "" } }
)

vim.api.nvim_call_function(
	"sign_define",
	{ "DapBreakpointRejected", { linehl = "", text = "", texthl = "", numhl = "" } }
)
