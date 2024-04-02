local M = {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
}

function set_nvimtree_when_open_term(terminal)
	local nvimtree = require("nvim-tree")
	local nvimtree_view = require("nvim-tree.view")
	if nvimtree_view.is_visible() and terminal.direction == "horizontal" then
		local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
		nvimtree.toggle()
		nvimtree_view.View.width = nvimtree_width
		nvimtree.toggle(false, true)
	end
end

M.config = function()
	require("toggleterm").setup({
		size = 8,
		open_mapping = [[<c-\>]],
		on_open = function(_)
			-- check NvimTree is visible
			local name = vim.fn.bufname("nvimtree")
			local winnr = vim.fn.bufwinnr(name)
			if winnr ~= -1 then
				local pwd = vim.fn.getcwd()
				vim.defer_fn(function()
					local cmd = string.format("NvimTreeToggle %s ", pwd)
					vim.cmd(cmd)
					local cmd_retoggle = string.format("NvimTreeToggle  %s | 1 | wincmd p", pwd)
					vim.cmd(cmd_retoggle)
				end, 100)
			end
		end,
		hide_numbers = true,
		shade_filetypes = { "none", "fzf" },
		shade_terminals = true,
		shading_factor = "1",
		start_in_insert = true,
		insert_mappings = false,
		terminal_mappings = true,
		persist_size = false,
		direction = "horizontal",
		close_on_exit = true,
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
		local opts = { buffer = 0 }
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
	end
end

return M
