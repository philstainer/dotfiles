return function()
  return {
    on_attach = function(client, bufnr)
      if client.name == 'sumneko_lua' then
        client.resolved_capabilities.document_formatting = false
      end
    end,
    settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
      }
    }
  }
end
