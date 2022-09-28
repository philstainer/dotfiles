local functions = require 'phil.utils.functions'

local ok, plenary_reload = pcall(require, 'plenary.reload')
if not ok then
  reloader = require
else
  reloader = plenary_reload.reload_module
end

_G.reload = function()
  local counter = 0

  for moduleName in pairs(package.loaded) do
    if functions.starts_with(moduleName, 'phil.') then
      package.loaded[moduleName] = nil
      require(moduleName)
      counter = counter + 1
    end
  end

  -- clear nvim-mapper keys
  vim.g.mapper_records = nil

  print('Reloaded ' .. counter .. ' modules!')
end

_G.ReloadConfig = function()
  for name, _ in pairs(package.loaded) do
    if name:match('^cnull') then package.loaded[name] = nil end
  end

  dofile(vim.env.MYVIMRC)
end

P = function(...)
  print(vim.inspect(...))
  return ...
end

RELOAD = function(...) return reloader(...) end

R = function(name)
  RELOAD(name)
  return require(name)
end

function GET_CONFIG(name)
  return string.format('require("phil.plugins.%s")', name)
end

function REQ_CONFIG(name) return require(string.format('phil.plugins.%s', name)) end
function REQ_CONFIGS(plugin, names)
  for _, name in ipairs(names) do
    require(string.format('phil.plugins.%s.%s', plugin, name))
  end
end

function GET_PARENT_DIRECTORY()
  local current_path = debug.getinfo(1).source
  local split_path = functions.split_string(current_path, '/')
  local path_len = #(split_path)

  return split_path[path_len - 1]

end
