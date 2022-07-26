local M = {}

M.show_diagnostics = function(opts)
  opts = opts or {}
  vim.diagnostic.setloclist({open = false})
  require'telescope.builtin'.loclist(opts)
end

return M

