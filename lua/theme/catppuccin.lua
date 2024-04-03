local M = {
	"catppuccin/nvim",
	name = "catppuccin",
} --asdad

M.config = function()
	require("catppuccin").setup({
		--highlight_overrides = {
		--	mocha = function(mocha)
		--		return {
		--			Comment = { fg = mocha.green },
		--		}
		--	end,
		--},
	})
end

return M
