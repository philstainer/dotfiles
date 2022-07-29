local ok_kind, lspkind = pcall(require, 'lspkind')
if not ok_kind then return end

local ok_lua, luasnip = pcall(require, 'luasnip')
if not ok_lua then return end

local ok, cmp = pcall(require, 'cmp')
if not ok then return end

cmp.setup({
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item {
      behavior = cmp.SelectBehavior.Insert
    },
    ['<C-p>'] = cmp.mapping.select_prev_item {
      behavior = cmp.SelectBehavior.Insert
    },

    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),

    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }),

    ['<tab>'] = cmp.config.disable
  },
  sources = {
    {name = 'gh_issues'}, {name = 'nvim_lua'}, {name = 'nvim_lsp'},
    {name = 'path'}, {name = 'luasnip'}, {name = 'buffer', keyword_length = 5},
    {name = 'cmp_tabnine', keyword_length = 4, max_item_count = 20}
  },
  snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = '[buf]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[api]',
        path = '[path]',
        luasnip = '[snip]',
        tn = '[TabNine]'
      }
    }
  },
  experimental = {native_menu = false, ghost_text = true}
})
