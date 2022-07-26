addEventListener('LuaHighlight', {'TextYankPost *'},
                 function() require'vim.highlight'.on_yank {timeout = 50} end)


-- Auto reload tmux
vim.api.nvim_command([[
    augroup AutoReloadTmux
    autocmd BufWritePost .tmux.conf       silent execute ':!tmux source-file %'
    autocmd BufWritePost .tmux.local.conf silent execute ':!tmux source-file %'
    augroup END 
]])

-- Auto reload prettierd
vim.api.nvim_command([[
    augroup AutoReloadPrettierd
    autocmd BufWritePost .prettier*       silent execute ':!prettierd restart %'
    autocmd BufWritePost .prettier*       silent execute ':!eslint_d restart %'
    augroup END 
]])

vim.api.nvim_command([[
    augroup AutoReloadEslint
    autocmd BufWritePost .eslint*       silent execute ':!eslint_d restart %'
    augroup END 
]])