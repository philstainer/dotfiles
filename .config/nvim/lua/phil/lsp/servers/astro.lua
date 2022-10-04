return function()
  return {
    on_attach = function(client, bufnr)
      -- tsserver, stop messing with prettier da fuck!
      client.server_capabilities.document_formatting = false

    end
  }
end
