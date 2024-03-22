return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    "onsails/lspkind-nvim",
    "L3MON4D3/LuaSnip",
  },
  lazy = false,
  config = function()
    local lspkind = require("lspkind")
    local cmp = require('cmp')

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        --{ name = 'nvim_lsp', option = { use_show_condition = false  } },
        { name = 'luasnip', option = { use_show_condition = false } },
        --{ name = 'buffer', option = { get_bufnrs = function() return { vim.api.nvim_get_current_buf() } end } },
      }),
      formatting = {
        lspkind.cmp_format({ wirth_text = false, maxwidth = 50 })
      }
    })

    vim.cmd [[
      set completeopt=menuone,noinsert,noselect
      highlight! default link CmpItemKind CmpItemMenuDefault
    ]]
  end,
}
