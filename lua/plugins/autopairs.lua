return {
  "windwp/nvim-autopairs",
  lazy = false,
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
      disable_filetype = { 'TelescopePrompt', 'vim' }
    })
  end,
}
