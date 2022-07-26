local lsp = require('lspconfig')
local functions = require 'phil.utils.functions'

local luaformat = require 'phil.lsp.servers.formatters.lua-format'
local prettierd = require 'phil.lsp.servers.formatters.prettierd'

local eslint_d = require 'phil.lsp.servers.linters.eslint_d'

local formatter = prettierd
local linter = eslint_d

local languages = {
  lua = {luaformat},
  typescript = {linter},
  javascript = {formatter},
  typescriptreact = {linter},--, formatter},
  ['typescript.tsx'] = {linter},
  javascriptreact = {linter},
  ['javascript.jsx'] = {linter},
  yaml = {formatter},
  json = {formatter},
  html = {formatter},
  scss = {formatter},
  css = {formatter},
  markdown = {formatter}
}

return function(on_attach)
  return {
    on_attach = on_attach,
    root_dir = function(fname)
      local cwd = lsp.util.root_pattern('tsconfig.json')(fname) or
                      lsp.util.root_pattern('.eslintrc.js', '.git')(fname) or
                      lsp.util
                          .root_pattern('package.json', '.git/', '.zshrc')(fname);
      return cwd
    end,
    filetypes = vim.tbl_keys(languages),
    init_options = {documentFormatting = true},
    settings = {
      rootMarkers = {'package.json', '.git'},
      lintDebounce = 500,
      languages = languages
    }
  }
end
