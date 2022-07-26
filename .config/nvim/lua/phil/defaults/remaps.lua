-- quit
nnoremap('<leader>q', '<cmd>q<CR>', 'editor', 'quit', 'Quits editor')
nnoremap('<leader>Q', '<cmd>q!<CR>', 'editor', 'quit_force',
         'Force quits editor')

nnoremap('<leader><leader>x', ':source %<CR>', 'editor', 'source_file',
         'Source configuration')

-- reload
nnoremap('<leader><CR>', '<cmd>lua reload()<CR>', 'editor', 'reload',
         'Reloads configuration')

-- undo
nnoremap('<leader>u', '<cmd>UndotreeToggle<CR>', 'undo', 'undo',
         'Toggle undo history')

-- Remove exit mode
nnoremap('Q', '<nop>', 'unmap', 'unmap_exit_mode', 'Remove exit mode',
         {silent = true})

-- move upper/down on visual
-- vnoremap('J', ":m '<-2<CR>gv==gv'", 'remap', 'remap_move_upper_on_visual', -- -- vnoremap('K', '<cmd>m "<-2<CR>gv=gv"', 'remap', 'remap_move_upper_on_visual',
--          'Move upper on visual') -- --          'Move upper on visual')
-- vnoremap('K', ":m '>+1<CR>gv==gv'", 'remap', 'remap_move_down_on_visual', -- -- vnoremap('J', '<cmd>m ">+1<CR>gv=gv"', 'remap', 'remap_move_down_on_visual',
--          'Move down on visual') -- --          'Move down on visual')

-- -- Move text up and down
-- vnoremap('H', ":m .+1<CR>==", 'line', 'move_line_down', 'Move line down')
-- vnoremap('T', ":m .-2<CR>==", 'line', 'move_line_up', 'Move line up')

-- when going to next search, we center screen
nnoremap('n', 'nzzzv', 'remap', 'remap_go_next_search',
         'When going to next search, we center screen')
nnoremap('N', 'Nzzzv', 'remap', 'remap_go_previous_search',
         'When going to previous search, we center screen')

-- navigate quick fix
nnoremap(']q', ':cnext<CR>', 'remap', 'remap_next_quickfix',
         'Navigate to next quickfix')
nnoremap('[q', ':cprev<CR>', 'remap', 'remap_previous_quickfix',
         'Navigate to previous quickfix')

-- keep the cursor in place when joining lines
nnoremap('J', 'mzJ`z', 'remap', 'keep_cursor_in_place',
         'Keep cursor in place when joining lines')

-- yank
nnoremap('Y', 'yg$', 'remap', 'remap_yank_to_end_line', 'Yank to end of line')
nnoremap('<leader>y', '"+y', 'remap', 'remap_yank_clip_normal',
         'Yank to clipboard on normal')
vnoremap('<leader>y', '"+y', 'remap', 'remap_yank_clip_visual',
         'Yank to clipboard on visual')
nnoremap('<leader>Y', 'gg"+yG', 'remap', 'remap_yank_whole_file',
         'Yank all text on screen')

-- paste
xnoremap('<leader>p', '"_dp', 'remap', 'remap_delete_without_copy',
         'Cut text without copy')

-- deletes without copy
nnoremap('<leader>d', '"_d', 'remap', 'remap_deletes_on_visual',
         'Deletes on visual')
vnoremap('<leader>d', '"_d', 'remap', 'remap_deletes_on_normal',
         'Deletes on normal')

-- exit insert mode
inoremap('<C-c>', '<esc>', 'remap', 'exit_insert_mode', 'Exit insert mode')

-- maps c-n / c-t to navigate while searching with /
vim.api.nvim_exec([[
cnoremap <expr> <c-n> getcmdtype() =~ '[\/?]' ? '<c-g>' : '<c-n>'
cnoremap <expr> <c-p> getcmdtype() =~ '[\/?]' ? '<c-t>' : '<c-p>'
]], false)

-- npm alias
nnoremap('<leader>ni', ':!npm i ', 'alias', 'npm install', 'Npm install package')
nnoremap('<leader>nd', ':!npm i -D ', 'alias', 'npm dev install',
         'Npm install dev package')
