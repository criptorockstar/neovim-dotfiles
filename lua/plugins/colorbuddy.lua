return {
  "tjdevries/colorbuddy.nvim",
  config = function()
    local colorbuddy = require("colorbuddy.init")
    local Color = colorbuddy.Color
    local colors = colorbuddy.colors
    local Group = colorbuddy.Group
    local groups = colorbuddy.groups
    local styles = colorbuddy.styles

    Color.new('black', '#000000')
    Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
    Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
    Group.new('Visual', colors.none, colors.base03, styles.reverse)
  end,
}
