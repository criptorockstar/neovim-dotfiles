local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function options(desc)
    return vim.tbl_extend('force', opts, { desc = desc })
end

local M = {}

-- leader
vim.g.mapleader = "\\"

-- remap
map("n", "<leader>pv", vim.cmd.Ex, options("Navigate"))

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

map("n", "<C-Up>", "<CMD>m .-2<CR>==", options("󰜸 Move line up"))
map("n", "<C-Down>", "<CMD>m .+1<CR>==", options("󰜯 Move line down"))

-- Scroll
map("n", "<C-d>", "<C-d>zz", options(" Scroll down"))
map("n", "<C-u>", "<C-u>zz", options(" Scroll up"))

-- NvimTree
map("n", "<C-b>", ":NvimTreeToggle<CR>", options("󰔱 Toggle nvimtree"))

-- Pane navigation
map("n", "<C-h>", "<C-w>h", options("󰜲 Navigate left"))
map("n", "<C-l>", "<C-w>l", options("󰜵 Navigate right"))
map("n", "<C-k>", "<C-w>k", options("󰜸 Navigate up"))
map("n", "<C-j>", "<C-w>j", options("󰜯 Navigate down"))

-- Window managment
map("n", "<leader><leader>v", ":vsplit<CR>", options("󰤼 Vertical Split"))
map("n", "<leader><leader>h", ":split<CR>", options("󰤻 Horizontal Split"))
map("n", "<leader><leader>m", ":MaximizerToggle<CR>", options("󰯌 Toggle minimize"))

-- Telescope
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", options(" Find keymaps"))
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", options("󱘟 Find file"))
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", options(" Live grep"))
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", options(" Buffers"))

-- Comment
map("n", "<A-/>", ':execute "normal gcc"<CR>', options("  Toggle comment"))
map("x", "<A-/>", ':<C-u>execute "normal gv"<bar>execute "normal gcc"<CR>', options("  Toggle comment (visual)"))

-- Tabs
map("n", "<Tab>", "<cmd>BufferNext<CR>", options(" Next Tab"))
map("n", "<S-Tab>", "<cmd>BufferPrevious<CR>", options(" Prev Tab"))
map("n", "<C-x>", "<cmd>BufferClose<CR>", options(" Close Tab"))

return M
