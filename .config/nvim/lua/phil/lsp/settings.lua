local lsp_status = require('lsp-status')
local handlers = require('phil.lsp.handlers')

-- for debugging lsp
-- Levels by name: 'trace', 'debug', 'info', 'warn', 'error'
vim.lsp.set_log_level('error')

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {spacing = 0, prefix = '■'},

      -- see: ":help vim.lsp.diagnostic.set_signs()"
      signs = true,

      update_in_insert = false
    })

lsp_status.register_progress()

local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities =
    vim.tbl_deep_extend('keep', capabilities, lsp_status.capabilities)
capabilities.textDocument.codeLens = {dynamicRegistration = false}
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

M.default_lsp_config = {
  on_attach = handlers.on_attach,
  capabilities = capabilities
}

M.servers = {
  -- efm = require('phil.lsp.servers.efm')(handers.on_attach),
  bashls = {},
  yamlls = {},
  jsonls = require('phil.lsp.servers.jsonls')(),
  tsserver = require('phil.lsp.servers.tsserver')(),
  html = {},
  cssls = {},
  sumneko_lua = require('phil.lsp.servers.sumneko_lua')(),
  dockerls = {},
  gopls = require('phil.lsp.servers.gopls')(),
  tailwindcss = require('phil.lsp.servers.tailwindcss')(),
  prismals = {},
  astro = {}
  -- ccls = require('phil.lsp.servers.ccls')()
  -- graphql = {},
}

M.setup = function()
  require('nvim-lsp-installer').setup {
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
      icons = {
        server_installed = '✓',
        server_pending = '➜',
        server_uninstalled = '✗'
      }
    }
  }

  for serverName, config in pairs(M.servers) do
    -- local ok, server = lsp_installer_servers.get_server(serverName)
    -- if ok then
    --     if not server:is_installed() then
    --         print('installing ' .. serverName .. '...')
    --         server:install()
    --         print(serverName .. ' installed')
    --     end
    -- end
    --
    -- server:setup(vim.tbl_deep_extend('force', M.default_lsp_config, config))
    -- vim.cmd [[ do User LspAttachBuffers ]]

    -- Run default on_attach and on_attach defined in server config
    local middlewareAttach = {
      on_attach = function(client, bufnr)
        M.default_lsp_config.on_attach(client, bufnr)

        if (config.on_attach) then config.on_attach(client, bufnr) end

      end
    }

    -- Merge default config with server config
    local newConfig = vim.tbl_deep_extend('force', M.default_lsp_config, config)
    -- Merge middlewareConfig with newConfig
    local mergedConfig = vim.tbl_deep_extend('force', newConfig,
                                             middlewareAttach)

    require'lspconfig'[serverName].setup(mergedConfig)
  end
end

return M
