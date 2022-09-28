local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then return end

local keymap = require('phil.keymap')

-- nnoremap('-', '<cmd>NvimTreeToggle<CR>', 'explorer', 'explorer_toggle',
--          'Toggle explorer')

keymap.nnoremap('-', function() nvim_tree.toggle() end)
