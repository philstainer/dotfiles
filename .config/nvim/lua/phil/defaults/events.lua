-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', {clear = true}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({higroup = 'IncSearch', timeout = 40})
  end
})

-- Auto reload tmux
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('AutoReloadTmux', {clear = true}),
  pattern = '.tmux*',
  callback = function()
    vim.api.nvim_command('silent !tmux source-file %')
    print 'Reloading tmux...'
  end
})

-- Auto reload prettierd
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('AutoPrettierd', {clear = true}),
  pattern = '.prettier*',
  callback = function()
    vim.api.nvim_command('silent !prettierd restart')
    vim.api.nvim_command('silent !eslint_d restart')
    print 'Restarting prettierd and eslint_d...'
  end
})

-- Auto reload eslist_d
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('AutoEslist_d', {clear = true}),
  pattern = '.eslint*',
  callback = function()
    vim.api.nvim_command('silent !eslint_d restart')
    print 'Restarting eslint_d...'
  end
})

vim.api.nvim_create_autocmd({'BufRead', 'BufEnter'}, {
  group = vim.api.nvim_create_augroup('astro-detect', {clear = true}),
  pattern = '*.astro',
  callback = function() vim.bo.filetype = 'astro' end
})

vim.api.nvim_create_autocmd({'BufRead', 'BufEnter'}, {
  group = vim.api.nvim_create_augroup('json-detect', {clear = true}),
  pattern = '*.json',
  callback = function() vim.bo.filetype = 'json' end
})
-- autocmd BufRead,BufEnter *.astro set filetype=astro)

-- Compile and reload file
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('Packer', {clear = true}),
  pattern = 'plugins.lua',
  callback = function() vim.cmd('source <afile> | PackerCompile') end
})
