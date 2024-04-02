local map = vim.keymap.set

local function options(desc)
	return vim.tbl_extend("force", { noremap = true, silent = true }, { desc = desc })
end

-- leader
vim.g.mapleader = "\\"

-- remap
map("n", "<leader>pv", vim.cmd.Ex, options("Navigate"))

-- Text edit
map("n", "y", '"+y', options("󰆒 Copy"))
map("n", "p", "p`[v`]=", options("󰆒 Paste"))

map("n", "x", "x", options("󰆐 Cut"))
map("n", "u", "<CMD>u<CR>", options("󰕌 Undo"))
map({ "n", "v", "i" }, "<C-z>", "<CMD>u<CR>", options("󰕌 Undo"))
map("n", "<C-r>", "<CMD>redo<CR>", options("󰑎 Redo"))

map("n", "<C-a>", "gg0vG", options(" Select all"))
map("n", "n", "nzzzv", options(" Next"))
map("n", "N", "Nzzzv", options(" Previous"))

-- Indentation
map("v", "<", "<gv", options(" Indent backward"))
map("v", ">", ">gv", options(" Indent forward"))

map("n", "<C-Up>", "<CMD>m .-2<CR>==", options("󰜸 Move line up"))
map("n", "<C-Down>", "<CMD>m .+1<CR>==", options("󰜯 Move line down"))

-- Scroll
map("n", "<C-d>", "<C-d>zz", options(" Scroll down"))
map("n", "<C-u>", "<C-u>zz", options(" Scroll up"))

-- NvimTree
map("n", "<C-b>", ":NvimTreeToggle<CR>", options("󰔱 Toggle nvimtree"))

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
map("n", "<C-w><left>", "<C-w><", options("󰡎 Increase width"))
map("n", "<C-w><right>", "<C-w>>", options("󰡌 Decrease width"))
map("n", "<C-w><up>", "<C-w>+", options("󰡏 Increase height"))
map("n", "<C-w><down>", "<C-w>-", options("󰡍 Decrease height"))

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", options("󱘟 Find file"))
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", options(" Live grep"))
map("n", "<leader>fc", "<cmd>Telescope buffers<cr>", options(" Buffers"))
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", options(" Find keymaps"))
map("n", "<leader>fk", "<cmd>Telescope help_tags<cr>", options("󰋗 Help tags"))

-- Comment
map("n", "<A-/>", ':execute "normal gcc"<CR>', options("  Toggle comment"))
map("x", "<A-/>", ':<C-u>execute "normal gv"<bar>execute "normal gcc"<CR>', options("  Toggle comment (visual)"))

-- Tabs
map("n", "<Tab>", "<cmd>BufferNext<CR>", options(" Next Tab"))
map("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", options(" Prev Tab"))
map("n", "<C-x>", "<cmd>BufferClose<CR>", options(" Close Tab"))

-- Runner
map("n", "<leader>rc", ":RunCode<CR>", options(" Run code"))
map("n", "<leader>rp", ":RunProject<CR>", options(" Run project"))
map("n", "<leader>rf", ":RunFile<CR>", options("󱧻 Run file"))
map("n", "<leader>rx", ":RunClose<CR>", options(" Run close"))

-- LSP
map("n", "<leader>e", vim.diagnostic.open_float, options(" Open diagnostics"))
map("n", "[d", vim.diagnostic.goto_prev, options(" Go to prev"))
map("n", "]d", vim.diagnostic.goto_next, options(" Go to next"))
map("n", "<leader>q", vim.diagnostic.setloclist, options(" Close diagnostic"))
