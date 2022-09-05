local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then return end

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  respect_buf_cwd = false,
  hijack_directories = {enable = true, auto_open = true},
  diagnostics = {
    enable = false,
    icons = {hint = '', info = '', warning = '', error = ''}
  },
  update_focused_file = {enable = true, update_root = true, ignore_list = {}},
  system_open = {cmd = nil, args = {}},
  filters = {dotfiles = false, custom = {}, exclude = {}},
  renderer = {
    highlight_git = true,
    highlight_opened_files = 'all',
    group_empty = true,
    icons = {show = {file = true, folder = true, git = false}}
  },
  actions = {open_file = {quit_on_open = true, resize_window = false}},
  view = {
    width = 40,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    -- auto_resize = false,
    mappings = {
      custom_only = false,
      list = {
        {key = 'a', cb = tree_cb('create')},
        {key = 'd', cb = tree_cb('remove')}, {key = 'x', cb = tree_cb('cut')},
        {key = 'c', cb = tree_cb('copy')}, {key = 'p', cb = tree_cb('paste')},
        {key = 'q', cb = tree_cb('close')}, {key = '-', cb = tree_cb('close')},
        {key = {'<CR>', 'o', '<2-LeftMouse>'}, cb = tree_cb('edit')},
        {key = {'<2-RightMouse>', '<C-]>'}, cb = tree_cb('cd')},
        {key = '<C-v>', cb = tree_cb('vsplit')},
        {key = '<C-x>', cb = tree_cb('split')},
        {key = '<C-t>', cb = tree_cb('tabnew')},
        {key = '<', cb = tree_cb('prev_sibling')},
        {key = '>', cb = tree_cb('next_sibling')},
        {key = 'P', cb = tree_cb('parent_node')},
        {key = '<BS>', cb = tree_cb('close_node')},
        {key = '<S-CR>', cb = tree_cb('close_node')},
        {key = '<Tab>', cb = tree_cb('preview')},
        {key = 'K', cb = tree_cb('first_sibling')},
        {key = 'J', cb = tree_cb('last_sibling')},
        {key = 'I', cb = tree_cb('toggle_git_ignored')},
        {key = 'H', cb = tree_cb('toggle_dotfiles')},
        {key = 'R', cb = tree_cb('refresh')},
        {key = 'r', cb = tree_cb('rename')},
        {key = '<C-r>', cb = tree_cb('full_rename')},
        {key = 'y', cb = tree_cb('copy_name')},
        {key = 'Y', cb = tree_cb('copy_path')},
        {key = 'gy', cb = tree_cb('copy_absolute_path')},
        {key = '[c', cb = tree_cb('prev_git_item')},
        {key = ']c', cb = tree_cb('next_git_item')},
        {key = 'g?', cb = tree_cb('toggle_help')}
      }
    }
  }
}
