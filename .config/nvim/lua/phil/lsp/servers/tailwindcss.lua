local tw_highlight = require('tailwind-highlight')

return function()
  return {
    on_attach = function(client, bufnr)
      tw_highlight.setup(client, bufnr, {
        single_column = false,
        mode = 'background',
        debounce = 200
      })
    end
  }
end
