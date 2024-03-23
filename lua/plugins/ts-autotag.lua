return {
  "windwp/nvim-ts-autotag",
  lazy = false,
  config = function()
    local autotag = require("nvim-ts-autotag")
    autotag.setup({})
  end,
}
