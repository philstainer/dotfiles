nnoremap('f', ':<C-U>call sneak#wrap("",           1, 0, 1, 1)<CR>', 'remap',
         'sneak_forward_multiline_search_normal', 'Remaps f to work multiline')

nnoremap('F', ':<C-U>call sneak#wrap("",           1, 1, 1, 1)<CR>', 'remap',
         'sneak_backward_multiline_search_normal', 'Remaps F to work multiline')

xnoremap('f', ':<C-U>call sneak#wrap(visualmode(), 1, 0, 1, 1)<CR>', 'remap',
         'sneak_forward_multiline_search_x', 'Remaps f to work multiline')

xnoremap('F', ':<C-U>call sneak#wrap(visualmode(), 1, 1, 1, 1)<CR>', 'remap',
         'sneak_backward_multiline_search_x', 'Remaps f to work multiline')

onoremap('f', ':<C-U>call sneak#wrap(v:operator,   1, 0, 1, 1)<CR>', 'remap',
         'sneak_forward_multiline_search_o', 'Remaps f to work multiline')

onoremap('F', ':<C-U>call sneak#wrap(v:operator,   1, 1, 1, 1)<CR>', 'remap',
         'sneak_backward_multiline_search_o', 'Remaps f to work multiline')