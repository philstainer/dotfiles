local ok, colorbuddy = pcall(require, 'colorbuddy')
if not ok then return end

require('material').setup({
  contrast = {
    sidebars = false,
    floating_windows = false,
    line_numbers = false,
    sign_column = false,
    cursor_line = false,
    non_current_windows = false,
    popup_menu = false
  },

  italics = {
    comments = false,
    keywords = false,
    functions = false,
    strings = false,
    variables = false
  },

  contrast_filetypes = {'terminal', 'packer', 'qf'},

  high_visibility = {lighter = false, darker = false},

  disable = {
    colored_cursor = false,
    borders = false,
    background = true,
    term_colors = false,
    eob_lines = false
  },

  lualine_style = 'default',

  async_loading = true,

  custom_highlights = {}
})

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
