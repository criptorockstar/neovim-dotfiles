require("settings.mappings")
require("settings.editor")
require("settings.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	defaults = {
		lazy = true,
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwplugin",
			"tarplugin",
			"tohtml",
			"tutor",
			"zipplugin",
		},
	},
	change_detection = {
		notify = true,
	},
}

require("lazy").setup({
	spec = {
    { import = "themes" },
    { import = "plugins" },
		{ import = "lsp" },
	},
}, opts)
