local ok, project = pcall(require, 'project_nvim')
if not ok then return end

project.setup {
  manual_mode = true, -- Enable to stop automatically changing cwd, annyoying...
  update_cwd = true,
  update_focused_file = {enable = true, update_cwd = true},
  patterns = {'.git', 'package.json', '.projectile'}
}
