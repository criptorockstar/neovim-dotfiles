return {
  "windwp/nvim-autopairs",
  lazy = false,
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-autopairs").setup({
      disable_filetype = { 'TelescopePrompt', 'vim' }
    })
  end,
}
