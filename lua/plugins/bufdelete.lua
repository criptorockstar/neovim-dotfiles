return {
  "famiu/bufdelete.nvim",
  priotrity = 99,
  config = function()
     require('bufdelete').bufdelete(0, true)
  end,
}
