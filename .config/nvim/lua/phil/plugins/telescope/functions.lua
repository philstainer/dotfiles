local M = {}

M.search_config = function()
  require('telescope.builtin').find_files({
    prompt_title = '< NvimConfig >',
    cwd = '$HOME/.config/nvim'
  })
end

return M
