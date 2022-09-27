local M = {}

M.set_default = function(client, bufnr)
  local function buf_set_keymap(...) bufnoremap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local cap = client.server_capabilities

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Definition
  if cap.definitionProvider then
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', 'lsp',
                   'lsp_go_to_definition', 'Go to definition')
    buf_set_keymap('n', 'gT', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
                   'lsp', 'lsp_type_definition', 'Go to type definition')
  end

  if client.supports_method('textDocument/declaration') then
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', 'lsp',
                   'lsp_go_to_declaration', 'Go to declaration')
  end

  -- Hover
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', 'lsp',
                 'lsp_hover_docs', 'Hover Documentation')

  -- Implementation
  if cap.implementationProvider then
    buf_set_keymap('n', 'gI',
                   '<cmd>lua require(\'telescope.builtin\').lsp_implementations()<CR>',
                   'lsp', 'lsp_goto_implementation', 'Go to implementation')
  end

  -- References
  if cap.referencesProvider then
    buf_set_keymap('n', '<leader>tr',
                   '<cmd>lua require(\'telescope.builtin\').lsp_references()<CR>',
                   'lsp', 'lsp_references', 'Show references')
  end

  -- Diagnostic
  buf_set_keymap('n', '<leader>td',
                 '<cmd>lua require(\'telescope.builtin\').diagnostics()<CR>',
                 'lsp', 'lsp_show_diagnostics', 'Show diagnostics')
  buf_set_keymap('n', '<leader>tD', '<cmd>lua vim.diagnostic.open_float()<CR>',
                 'lsp', 'lsp_show_float_diagnostics',
                 'Show diagnostics in floating window')

  buf_set_keymap('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>',
                 'lsp', 'lsp_next_diagnostic', 'Next diagnostic');
  buf_set_keymap('n', '<leader>gd', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
                 'lsp', 'lsp_previous_diagnostic', 'Previous diagnostic')

  -- Formatting
  if cap.documentFormattingProvider then
    buf_set_keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>',
                   'lsp', 'lsp_format', 'Format Code')
  elseif cap.documentRangeFormattingProvider then
    buf_set_keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>',
                   'lsp', 'lsp_format_range', 'Format Code')
  end

  -- Document Symbols e.g function names etc
  if cap.documentSymbolProvider then
    buf_set_keymap('n', '<leader>ts',
                   '<cmd>lua require(\'telescope.builtin\').lsp_document_symbols()<CR>',
                   'lsp', 'lsp_document_symbols', 'Document symbols')
  end

  -- Function signature help
  buf_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                 'lsp', 'lsp_signature_help', 'Show signature')

  -- Code Actions
  if cap.codeActionProvider then
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                   'lsp', 'lsp_code_action', 'Code Actions')
    buf_set_keymap('v', '<leader>ca',
                   '<cmd>\'<,\'>lua vim.lsp.buf.range_code_action()<cr>', 'lsp',
                   'lsp_code_action_range', 'Code Action Range')
  end

  if cap.renameProvider then
    buf_set_keymap('n', '<leader>cr', ':lua vim.lsp.buf.rename()<CR>', 'lsp',
                   'rename', 'Rename')
  end

  if cap.documentHighlightProvider then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  -- Debug info
  buf_set_keymap('n', '<leader>flc', ':lua P(vim.lsp.get_active_clients())<CR>',
                 'lsp', 'lsp_debug_clients', '[DEBUG] LSP clients')
  buf_set_keymap('n', '<leader>fll', ':lua P(vim.lsp.get_log_path())<CR>',
                 'lsp', 'lsp_debug_logs', '[DEBUG] LSP show log path')
  buf_set_keymap('n', '<leader>fli', ':LspInfo<CR>', 'lsp', 'lsp_info',
                 '[DEBUG] LSP Info')
  buf_set_keymap('n', '<leader>rr', ':LspRestart<CR>', 'lsp', 'lsp_restart',
                 'Restart LSP')
end

function M.set_typescript(client, bufnr)
  local function buf_set_keymap(...) bufnoremap(bufnr, ...) end

  local ts_utils = require('nvim-lsp-ts-utils')

  -- defaults
  ts_utils.setup {}

  -- required to fix code action ranges and filter diagnostics
  ts_utils.setup_client(client)

  buf_set_keymap('n', '<leader>fo', ':TSLspOrganize<CR>', 'lsp',
                 'lsp_typescript_organize', 'Organize imports')
  buf_set_keymap('n', '<leader>fc', ':TSLspFixCurrent<CR>', 'lsp',
                 'lsp_typescript_fix_current', 'Fix current')
  -- buf_set_keymap("n", "gr", ":TSLspRenameFile<CR>", 'lsp', 'lsp_', '')
  buf_set_keymap('n', '<leader>fi', ':TSLspImportAll<CR>', 'lsp',
                 'lsp_typescript_import_all', 'Import all')
end

return M
