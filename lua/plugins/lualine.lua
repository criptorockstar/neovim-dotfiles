local config = function()
  local theme = require("lualine.themes.codedark")

  -- set bg transparency in all modes
  theme.normal.c.bg = nil

  require('lualine').setup({
    options = {
      theme = theme,
      globalstatus = true,
    },
  })
end

return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = config,
}
