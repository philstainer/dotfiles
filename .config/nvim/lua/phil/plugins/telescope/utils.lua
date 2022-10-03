local M = {}

M.project_files = function(opts)
  opts = opts or {}

  -- local ok = pcall(require'telescope.builtin'.git_files, opts)
  -- if not ok then require'telescope.builtin'.find_files(opts) end
  require'telescope.builtin'.find_files(opts)
end

return M
