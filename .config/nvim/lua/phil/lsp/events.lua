local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

addEventListener('show diagnostic popup on cursor hold',
                 {'CursorHold <buffer>'}, function()
                  vim.diagnostic.open_float()
end)

if filetype == 'rust' then
  vim.cmd(
      [[autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request { ]] ..
          [[aligned = true, prefix = " » " ]] .. [[} ]])
end
