-- Projects 
nnoremap('<leader>pp', '<cmd>Telescope projects<CR>', 'telescope',
         'telescope_projects', 'Projects')

-- Search
nnoremap('<leader>ps',
         '<cmd>lua require(\'telescope.builtin\').grep_string({ search = vim.fn.input("Grep For > ")})<CR>',
         'telescope', 'telescope_grep', 'Grep files')
nnoremap('<leader>pl',
         '<cmd>lua require(\'telescope.builtin\').live_grep()<CR>', 'telescope',
         'telescope_live_files', 'Find live files')

-- Find files
nnoremap('<leader>pf',
         '<cmd>lua require(\'telescope.builtin\').find_files()<CR>',
         'telescope', 'telescope_files', 'Find files')

-- Nvim config
nnoremap('<leader>cc',
         '<cmd>lua require(\'phil.plugins.telescope.functions\').search_config()<CR>',
         'telescope', 'telescope_search_config', 'Search neovim config')

-- Git
nnoremap('<leader>pg',
         '<cmd>lua require(\'telescope.builtin\').git_files()<CR>', 'telescope',
         'telescope_git_files', 'Find git files')
nnoremap('<leader>gl',
         '<cmd>lua require(\'telescope.builtin\').git_branches()<CR>',
         'telescope', 'telescope_git_branches', 'Search git branches')
nnoremap('<leader>gh',
         '<cmd>lua require(\'telescope.builtin\').git_bcommits()<CR>',
         'telescope', 'telescope_git_bcommits', 'Git commits on file')
-- nmap('<leader>gh', '<cmd>0Gclog!<CR>', 'git', 'git_navigate_history',
--      'Navigate history')

-- Buffers
nnoremap('<leader>bl', '<cmd>lua require(\'telescope.builtin\').buffers()<CR>',
         'telescope', 'telescope_buffers', 'Search buffers')

-- Search
nnoremap('<leader>rs', '<cmd>lua require(\'telescope.builtin\').resume()<CR>',
         'telescope', 'telescope_search', 'Resume Search')
