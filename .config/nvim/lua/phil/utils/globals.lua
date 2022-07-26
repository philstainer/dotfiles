local functions = require 'phil.utils.functions'

local ok, plenary_reload = pcall(require, "plenary.reload")
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
  for name,_ in pairs(package.loaded) do
    if name:match('^cnull') then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
end

P = function(...)
    print(vim.inspect(...))
    return ...
end

RELOAD = function(...)
  return reloader(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end
