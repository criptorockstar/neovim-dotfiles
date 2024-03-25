return {
  "glepnir/lspsaga.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("lspsaga").setup({
      move_in_saga = { prev = "<C-k>", next = "<C-j>" },
      finder_action_keys = {
        open = "<CR>",
      },
    })
  end
}
