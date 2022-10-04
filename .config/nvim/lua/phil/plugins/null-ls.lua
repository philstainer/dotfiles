local null_ls = require 'null-ls'

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

local nvim_version = vim.version()
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local langs = {
  'astro',
  'javascript',
  'javascriptreact',
  'typescript',
  'typescriptreact',
  'json'
}

null_ls.setup {
  debug = false,
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then

      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          if (nvim_version.minor >= 8) then
            vim.lsp.buf.format({ bufnr = bufnr })
          else
            vim.lsp.buf.formatting_sync()
          end
        end
      })
    end
  end,
  sources = {
    formatting.eslint_d.with({ filetypes = langs }),
    formatting.prettierd.with({ filetypes = langs }),
    formatting.rustywind.with({ filetypes = langs }),
    diagnostics.eslint_d.with({ filetypes = langs }),
    code_actions.eslint,
    diagnostics.cspell.with({ disabled_filetypes = { 'lua', 'NvimTree' } }),
    formatting.lua_format.with({
      extra_args = {
        '--tab-width',
        2,
        '--indent-width',
        2,
        '--double-quote-to-single-quote',
        '--chop-down-table'
      }
    }),
    formatting.beautysh
  }
}
