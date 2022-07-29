local ok, colorbuddy = pcall(require, 'colorbuddy')
if not ok then return end

vim.g.material_style = 'palenight'

colorbuddy.colorscheme 'material'

local c = require('colorbuddy.color').colors
local Group = require('colorbuddy.group').Group
local g = require('colorbuddy.group').groups
local s = require('colorbuddy.style').styles

Group.new('WinSeparator', nil, nil)

Group.new('CmpItemAbbr', g.Comment)
Group.new('CmpItemAbbrDeprecated', g.Error)
Group.new('CmpItemAbbrMatchFuzzy', g.CmpItemAbbr.fg:dark(), nil, s.italic)
Group.new('CmpItemKind', g.Special)
Group.new('CmpItemMenu', g.NonText)
