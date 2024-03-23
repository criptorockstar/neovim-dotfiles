return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {'nvim-tree/nvim-web-devicons'},
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        separator_style = 'thin',
        always_show_bufferline = false,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and "󰃤 " or (level:match("hint") and " " or " ")
            return " " .. icon .. count
        end,
        diagnostics_update_in_insert = true,
        close_command = "Bdelete",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          }
        },
      },
    })
  end,
}
