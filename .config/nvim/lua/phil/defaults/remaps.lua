local nnoremap = require('phil.keymap').nnoremap
local vnoremap = require('phil.keymap').vnoremap
local xnoremap = require('phil.keymap').xnoremap
local inoremap = require('phil.keymap').inoremap

-- quit
nnoremap('<leader>q', '<cmd>q<CR>') -- Quits editor
nnoremap('<leader>Q', '<cmd>q!<CR>') -- Force quits editor

nnoremap('<leader>u', ':UndotreeShow<CR>') -- Toggle undo history

-- When going to next search, we center screen
nnoremap('n', 'nzzzv')
nnoremap('N', 'Nzzzv')

nnoremap('J', 'mzJ`z') -- Keep cursor in place when joining lines

nnoremap('Y', 'yg$') -- Yank to end of line
nnoremap('<leader>y', '"+y') -- Yank to clipboard on normal
vnoremap('<leader>y', '"+y') -- Yank to clipboard on visual
nnoremap('<leader>Y', ':%y+<CR>') -- Yank all text on screen

xnoremap('<leader>p', '"_dP') -- Cut text without copy
nnoremap('<leader>d', '"_d') -- Deletes on visual
vnoremap('<leader>d', '"_d') -- Deletes on normal

inoremap('<C-c>', '<Esc>') -- Exit insert mode

nnoremap('Q', '<nop>') -- Remove exit mode

nnoremap('<C-k>', '<cmd>cnext<CR>zz') -- Next quick fix list
nnoremap('<C-j>', '<cmd>cprev<CR>zz') -- Prev quick fix list
nnoremap('<leader>k', '<cmd>lnext<CR>zz') -- Next location list
nnoremap('<leader>j', '<cmd>lprev<CR>zz') -- Prev location list

nnoremap('<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
nnoremap('<leader>x', '<cmd>!chmod +x %<CR>', {silent = true}) -- Make file executable

nnoremap('<leader>S', ':source %<CR>') -- Source configuration

-- nnoremap('<leader>ni', ':!npm i ', 'alias', 'npm install', 'Npm install package')
-- nnoremap('<leader>nd', ':!npm i -D ', 'alias', 'npm dev install',
--          'Npm install dev package')
