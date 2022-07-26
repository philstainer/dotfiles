local M = {}

function M.starts_with(str, start) return str:sub(1, #start) == start end

function M.tprint(table) print(vim.inspect(table)) end

function M.link_highlight(from, to, override)
  local hl_exists, _ = pcall(vim.api.nvim_get_hl_by_name, from, false)
  if override or not hl_exists then
    vim.cmd(('highlight link %s %s'):format(from, to))
  end
end

function M.is_linux() return vim.loop.os_uname().sysname == 'Linux' end

function M.has_value(tab, val)
  for index, value in ipairs(tab) do if value == val then return true end end

  return false
end

function M.split_string(s, delimiter)
  local result = {};
  for match in (s .. delimiter):gmatch('(.-)' .. delimiter) do
    table.insert(result, match);
  end
  return result;
end

return M;
