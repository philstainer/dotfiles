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
