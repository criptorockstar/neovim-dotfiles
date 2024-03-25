return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions

    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ['q'] = actions.close
          }
        }
      },
      extensions = {
        file_browser = {
          theme = 'dropdown',
          hijack_netrw = true,
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          mappings = {
            ["i"] = {
              ["<C-w>"] = function() vim.cmd("normal vbd") end,
            },
            ["n"] = {
              ['N'] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end
            }
          }
        }
      }
    })
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}
