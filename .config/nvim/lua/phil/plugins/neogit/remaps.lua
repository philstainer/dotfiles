local ok, neogit = pcall(require, 'neogit')
if not ok then return end

local nnoremap = require('phil.keymap').nnoremap

nnoremap('<leader>gs', function() neogit.open({}) end);
nnoremap('<leader>ga', '<cmd>!git fetch --all<CR>');
nnoremap('<leader>vv', ':DiffviewOpen ');
