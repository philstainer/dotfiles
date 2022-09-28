local present, luasnip = pcall(require, 'luasnip')
if not present then return end

local types = require 'luasnip.util.types'

luasnip.config.set_config({
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = 'TextChanged,TextChangedI',

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  ext_opts = {
    [types.choiceNode] = {
      active = {virt_text = {{' <- Current Choice', 'NonTest'}}}
    }
  }
})

require('luasnip.loaders.from_vscode').lazy_load()

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file(
                             'lua/phil/snippets/*.lua', true)) do
  loadfile(ft_path)()
end
