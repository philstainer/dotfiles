local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then return end

local navic_ok, navic = pcall(require, "nvim-navic")
if not navic_ok then return end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    -- disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
    globalstatus = true
  },
  sections = {
    lualine_a = {{'mode', fmt = function(str) return str:sub(1, 1) end}},
    lualine_b = {'branch', {'diff', source = diff_source}, 'diagnostics'},
    lualine_c = {
      {'filename', path = 1}, {navic.get_location, cond = navic.is_available}
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
