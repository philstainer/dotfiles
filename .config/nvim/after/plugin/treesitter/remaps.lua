local ok, ts_utils = pcall(require, 'nvim-treesitter.ts_utils')
if not ok then return end

local M = {}

-- TODO: Add this
-- Lang log diff
-- https://github.com/numToStr/Comment.nvim/blob/master/lua/Comment/ft.lua

-- Go into insert mode
-- vim.cmd('startinsert') https://vi.stackexchange.com/questions/27796/how-to-change-editor-mode-from-lua-or-vim

-- Set cursor postion
-- nvim_win_set_cursor({window}, {pos}) https://neovim.io/doc/user/api.html#nvim_win_set_cursor()

M.log = function()

  local node = ts_utils.get_node_at_cursor(0, true)
  if node:type() ~= 'identifier' then return end

  local nodeText = ts_utils.get_node_text(node, 0)[1]

  local bufnr = 0 -- vim.api.nvim_get_current_buf() -- Gets the current buffer.
  local start, _, _ = node:start()

  local startIndex = start + 1
  local endIndex = start + 1

  vim.api.nvim_buf_set_lines(bufnr, startIndex, endIndex, false, {
    string.format('  console.log(`%s -> ${%s}`)', nodeText, nodeText)
  })
end

local reverseConcatTable = function(t)
  local reversedTable = {}

  for i = #t, 1, -1 do table.insert(reversedTable, t[i]) end

  return table.concat(reversedTable, '->'), reversedTable
end

local get_identifiers = function(curBufnr)
  local bufnr = curBufnr or 0

  local node = ts_utils.get_node_at_cursor(0, true)
  if node == nil then error('No Treesitter parser found.') end

  -- P(ts_utils.get_node_text(node))

  local root = ts_utils.get_root_for_node(node)

  -- local start_row = node:start()
  local parent = node:parent()
  -- local node_parent = ni

  local results = {}

  while (parent ~= nil and parent ~= root) do
    for node in parent:iter_children() do
      if (node:named() and node:type() == 'identifier') then
        table.insert(results, vim.treesitter.query.get_node_text(node, bufnr))
      end
    end

    parent = parent:parent()

  end

  return results, node, parent
end

M.logger = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local results, node = get_identifiers(bufnr)

  local items = reverseConcatTable(results)

  local start, _, _ = node:start()

  local startIndex = start + 1
  local endIndex = start + 1

  local filename = vim.fn.expand('%:t')

  vim.api.nvim_buf_set_lines(bufnr, startIndex, endIndex, false, {
    string.format('console.log(\'🚀 ~ file: %s ~ line %s ~ %s: \', %s)',
                  filename, startIndex, items,
                  vim.treesitter.query.get_node_text(node, bufnr))
  })

end

vim.keymap.set('n', '<Leader>cl', function() M.logger() end, {silent = true})

vim.keymap.set('n', '<Leader>cs', '<cmd>g/console/d<CR>', {silent = true})
