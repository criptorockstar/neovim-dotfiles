local M = {
	"CRAG666/code_runner.nvim",
	lazy = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

M.config = function()
	require("code_runner").setup({
		java = "cd $dir && javac $filename && java &filenameWithoutExt",
		python = "python -u",
		cpp = "cd $dir && g++ $filename -o $filenameWithoutExt && $dir/$filenameWithoutExt",
		typescript = "deno run",
		rust = "cd $dir && rustc $filename && $dir/$filenameWithoutExt",
		kotlin = "cd $dir && kotlinc $filename -include-runtime -d $filenameWithoutExt.class && kotlin $filenameWithoutExt",
	})
end

return M
