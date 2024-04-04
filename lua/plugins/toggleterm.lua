---@diagnostic disable: param-type-mismatch
local M = {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
}

M.config = function()
	require("toggleterm").setup({
		count = 1,
		size = 8,
		open_mapping = [[<c-\>]],
		on_open = function(_)
			local name = vim.fn.bufname("neo-tree")
			local winnr = vim.fn.bufwinnr(name)
			if winnr ~= 2 then
				local pwd = vim.fn.getcwd()
				vim.defer_fn(function()
					local cmd = string.format("Neotree toggle %s", pwd)
					vim.cmd(cmd)
					vim.defer_fn(function()
						vim.cmd("Neotree toggle")
					end, 50)
				end, 100)
			end
		end,
		hide_numbers = true,
		shade_filetypes = { "none", "fzf" },
		shade_terminals = true,
		shading_factor = "1",
		start_in_insert = false,
		insert_mappings = true,
		terminal_mappings = true,
		persist_size = false,
		close_on_exit = true,
		direction = "horizontal",
		shell = vim.o.shell,
		float_opts = {
			border = "single",
			col = 3,
			winblend = 3,
			title_pos = "left",
		},
		winbar = {
			enabled = false,
			name_formatter = function(term)
				return term.name
			end,
		},
	})

	function _G.set_terminal_keymaps()
		local opts = { buffer = true }
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
	end

	-- if you only want these mappings for toggle term use term://*toggleterm#* instead
	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

	-- split
	local Terminal = require("toggleterm.terminal").Terminal
	local vterm = Terminal:new({
		count = 2,
	})
	function vterm_toggle()
		vterm:toggle()
	end
	vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>lua vterm_toggle()<CR>", { noremap = true, silent = true })
end

return M
