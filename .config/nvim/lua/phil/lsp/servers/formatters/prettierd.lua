-- npm add --global prettierd
local prettierd = {
  formatCommand = 'prettierd "${INPUT}"',
  formatStdin = true,
  env = {
    -- string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')),
    string.format('PRETTIERD_LOCAL_PRETTIER_ONLY=1')
  }
}

return prettierd
