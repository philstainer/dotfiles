local lsp = require 'phil.lsp.settings'

local M = {}

-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
M.lsp_install_servers = function()
  local function installLanguageServer(languageServer)
    vim.cmd('LspInstall ' .. languageServer)
  end

  for server in pairs(lsp.servers) do installLanguageServer(server) end

end

return M
