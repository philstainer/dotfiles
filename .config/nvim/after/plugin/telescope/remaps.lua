local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then return end

local extensions = require'telescope'.extensions

local nnoremap = require('phil.keymap').nnoremap
local telescope_utils = require('phil.plugins.telescope.utils')

nnoremap('<leader>pp', function() extensions.projects.projects() end) -- Open projects

nnoremap('<leader>ps', function()
  require'telescope.builtin'.grep_string({search = vim.fn.input('Grep For > ')})
end) -- Search for text in files

nnoremap('<leader>pl', function() require'telescope.builtin'.live_grep() end) -- Live find

-- nnoremap('<leader>pf', function() telescope_utils.project_files() end) -- Find files
nnoremap('<C-p>', function() telescope_utils.project_files() end) -- Find files

nnoremap('<leader>cc', function()
  builtin.find_files({
    prompt_title = '< NvimConfig >',
    cwd = '$HOME/.config/nvim'
  })
end) -- Search files in nvim config

nnoremap('<leader>pb', function() require'telescope.builtin'.buffers() end) -- Buffers

nnoremap('<leader>pr', function() require'telescope.builtin'.resume() end) -- Resume

nnoremap('<leader>vh', function() require('telescope.builtin').help_tags() end) -- Help tags

-- Git
-- nnoremap('<leader>gf', function() require'telescope.builtin'.git_files() end) -- Git files
nnoremap('<leader>gb', function() require'telescope.builtin'.git_branches() end) -- Git branches

nnoremap('<leader>gc', function() require'telescope.builtin'.git_commits() end) -- Git commits
nnoremap('<leader>gfc', function() require'telescope.builtin'.git_bcommits() end) -- Git commits on file

nnoremap('<leader>gw', function() extensions.git_worktree.git_worktrees() end) -- Git work trees
nnoremap('<leader>gm',
         function() extensions.git_worktree.create_git_worktree() end) -- Git work trees

-- vim.keymap.set('n', '-', function() extensions.file_browser.file_browser() end,
--                {noremap = true})
