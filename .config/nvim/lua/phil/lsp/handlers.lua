local lsp_status = require('lsp-status')
local remaps = require('phil.lsp.remaps')
local functions = require 'phil.utils.functions'

local M = {}

M.on_attach = function(client, bufnr)
  -- print(client.name)
  remaps.set_default(client, bufnr)
  lsp_status.on_attach(client, bufnr)

  -- adds beatiful icon to completion
  require'lspkind'.init()

  -- add signature autocompletion while typing
  require'lsp_signature'.on_attach({
    floating_window = false,
    timer_interval = 500
  })

  require('illuminate').on_attach(client)

  local ignored = {'tailwindcss'}
  if not functions.has_value(ignored, client.name) then
    require('nvim-navic').attach(client, bufnr)
  end
end

return M
