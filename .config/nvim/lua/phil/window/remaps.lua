-- Use s instead of <C-w> to handle windows
-- nnoremap('s', '<C-w>', 'remap', 'remap_s', 'Remaps s to handle windows')
nnoremap('<C-Left>', '<cmd>wincmd h<CR>', 'window', 'window_move_left',
         'Move window left')
nnoremap('<C-Down>', '<cmd>wincmd j<CR>', 'window', 'window_move_down',
         'Move window down')
nnoremap('<C-Up>', '<cmd>wincmd k<CR>', 'window', 'window_move_up',
         'Move window up')
nnoremap('<C-Right>', '<cmd>wincmd l<CR>', 'window', 'window_move_right',
         'Move window right')

nnoremap('<leader>w+', '<cmd>vertical resize +5<CR>', 'window',
         'window_increase_size', 'Increase window size')
nnoremap('<leader>w-', '<cmd>vertical resize -5<CR>', 'window',
         'window_decrease_size', 'Decrease window size')
