local nnoremap = require('phil.keymap').nnoremap

local ContextSetup =
    require('phil.plugins.nvim-treesitter-context.settings').ContextSetup

nnoremap('<leader>cf', function() ContextSetup(true) end)
nnoremap('<leader>cp', function() ContextSetup(false) end)
