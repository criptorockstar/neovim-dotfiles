local map = vim.keymap.set

local function options(desc)
	return vim.tbl_extend("force", { noremap = true, silent = true }, { desc = desc })
end

-- leader
vim.g.mapleader = "\\"

-- remap
map("n", "<leader>pv", vim.cmd.Ex, options("󱣱 Navigate"))
map({ "v", "i" }, "<C-z>", "<CMD><CR>", options(" Disabled"))

-- Text edit
map("n", "y", '"+y', options("󰆒 Copy"))
map("n", "p", "p`[v`]=", options("󰆒 Paste"))

map("n", "x", "x", options("󰆐 Cut"))
map("n", "u", "<CMD>u<CR>", options("󰕌 Undo"))
map("n", "<C-r>", "<CMD>redo<CR>", options("󰑎 Redo"))

map("n", "<C-a>", "gg0vG", options(" Select all"))
map("n", "n", "nzzzv", options(" Next"))
map("n", "N", "Nzzzv", options(" Previous"))

-- Indentation
map("v", "<", "<gv", options(" Indent backward"))
map("v", ">", ">gv", options(" Indent forward"))

map("n", "<A-k>", "<CMD>m .-2<CR>==", options("󰜸 Move line up"))
map("n", "<A-j>", "<CMD>m .+1<CR>==", options("󰜯 Move line down"))

-- Scroll
map("n", "<C-d>", "<C-d>zz", options(" Scroll down"))
map("n", "<C-u>", "<C-u>zz", options(" Scroll up"))

-- NvimTree
map("n", "<C-b>", ":Neotree toggle<CR>", options("󰔱 Neo-tree toggle"))

-- Move Window
map("n", "<Space>", "<C-w>w", options("󰆾 Move"))
map("n", "<C-h>", "<C-w>h", options("󰜲 Navigate left"))
map("n", "<C-l>", "<C-w>l", options("󰜵 Navigate right"))
map("n", "<C-k>", "<C-w>k", options("󰜸 Navigate up"))
map("n", "<C-j>", "<C-w>j", options("󰜯 Navigate down"))

-- Split Window
map("n", "<leader>sh", ":split<Return><C-w>w", options("󰤻 Horizontal Split"))
map("n", "<leader>sv", ":vsplit<Return><C-w>w", options("󰤼 Vertical Split"))
map("n", "<leader>se", "<C-w>=", options(" Make split equal width"))
map("n", "<leader>sx", ":close<CR>", options(" Close current split"))

-- Resize Window
map("n", "<A-left>", "<C-w><", options("󰡎 Increase width"))
map("n", "<A-right>", "<C-w>>", options("󰡌 Decrease width"))
map("n", "<A-up>", "<C-w>+", options("󰡏 Increase height"))
map("n", "<A-down>", "<C-w>-", options("󰡍 Decrease height"))

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", options("󱘟 Find file"))
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", options("  Live grep"))
map("n", "<leader>fc", "<cmd>Telescope buffers<cr>", options(" Buffers"))
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", options(" Find keymaps"))
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", options("󰋗 Help tags"))

-- Comment
map("n", "<A-/>", ':execute "normal gcc"<CR>', options("  Toggle comment"))
map("x", "<A-/>", ':<C-u>execute "normal gv"<bar>execute "normal gcc"<CR>', options("  Toggle comment"))

-- Tabs
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", options(" Next Tab"))
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", options(" Prev Tab"))
map("n", "<C-x>", "<cmd>Bdelete<CR>", options(" Close Tab"))
map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", options(" Tab 1"))
map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", options(" Tab 2"))
map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", options(" Tab 3"))
map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", options(" Tab 4"))
map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", options(" Tab 5"))
map("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", options(" Tab 6"))
map("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", options(" Tab 7"))
map("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", options(" Tab 8"))
map("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", options(" Tab 9"))

-- Runner
map("n", "<leader>rc", ":RunCode<CR>", options(" Run code"))
map("n", "<leader>rf", ":RunFile<CR>", options("󱧻 Run file"))
map("n", "<leader>rx", ":RunClose<CR>", options(" Run close"))

-- LSP
map("n", "<leader>e", vim.diagnostic.open_float, options(" Open diagnostics"))
map("n", "[d", vim.diagnostic.goto_prev, options(" Go to prev"))
map("n", "]d", vim.diagnostic.goto_next, options(" Go to next"))
map("n", "q", vim.diagnostic.setloclist, options(" Close diagnostic"))

-- DAP
map("n", "<leader>dt", ":DapUiToggle<CR>", options(" Dap Toggle"))
map("n", "<leader>db", ":DapToggleBreakpoint<CR>", options(" Dap breakpoint"))
map("n", "<leader>dc", ":DapContinue<CR>", options(" Dap Continue"))
map("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", options(" Dap open"))
