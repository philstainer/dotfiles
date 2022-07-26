local lspkind = require 'lspkind'

local present, cmp = pcall(require, 'cmp')

if not present then return end

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
    -- ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<CR>'] = cmp.mapping.confirm({
    --   behavior = cmp.ConfirmBehavior.Insert,
    --   select = true
    -- }),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }),

    ['<tab>'] = cmp.config.disable
    -- ['<Tab>'] = function(fallback)
    --   if vim.fn.pumvisible() == 1 then
    --     vim.fn.feedkeys(vim.api
    --                         .nvim_replace_termcodes('<C-n>', true, true, true),
    --                     'n')
    --   elseif require('luasnip').expand_or_jumpable() then
    --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
    --                         '<Plug>luasnip-expand-or-jump', true, true, true),
    --                     '')
    --   else
    --     fallback()
    --   end
    -- end,
    -- ['<S-Tab>'] = function(fallback)
    --   if vim.fn.pumvisible() == 1 then
    --     vim.fn.feedkeys(vim.api
    --                         .nvim_replace_termcodes('<C-p>', true, true, true),
    --                     'n')
    --   elseif require('luasnip').jumpable(-1) then
    --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes(
    --                         '<Plug>luasnip-jump-prev', true, true, true), '')
    --   else
    --     fallback()
    --   end
    -- end
  },
  sources = {
    {name = 'gh_issues'}, {name = 'nvim_lua'}, {name = 'nvim_lsp'},
    {name = 'path'}, {name = 'luasnip'}, {name = 'buffer', keyword_length = 5},
    {name = 'cmp_tabnine', keyword_length = 4, max_item_count = 20}
  },
  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end
  },
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
    -- format = function(entry, vim_item)
    --   -- fancy icons and a name of kind
    --   vim_item.kind =
    --       require('lspkind').presets.default[vim_item.kind] .. ' ' ..
    --           vim_item.kind

    --   -- set a name for each source
    --   vim_item.menu = ({
    --     buffer = '[buf]',
    --     nvim_lsp = '[LSP]',
    --     nvim_lua = '[api]',
    --     path = '[path]',
    --     luasnip = '[snip]',
    --     tn = "[TabNine]",
    --   })[entry.source.name]

    --   return vim_item
    -- end
  },
  experimental = {native_menu = false, ghost_text = true}
})
