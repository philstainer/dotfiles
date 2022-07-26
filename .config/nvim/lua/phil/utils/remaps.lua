-- The same using nvim-mapper
Mapper = require('nvim-mapper')

local function map(type, input, output, category, unique_identifier,
                   description, opts)
  local options = {}
  if opts then options = vim.tbl_extend('force', options, opts) end

  -- vim.api.nvim_set_keymap(type, input, output, {}, category, unique_identifier, description, options)
  Mapper.map(type, input, output, options, category, unique_identifier,
             description)
end

local function noremap(type, input, output, category, unique_identifier,
                       description, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end

  -- vim.api.nvim_set_keymap(type, input, output, { noremap = true })
  Mapper.map(type, input, output, options, category, unique_identifier,
             description)
end

function bufnoremap(bufnr, type, input, output, category, unique_identifier,
                    description, opts)
  local options = {noremap = true, silent = true}
  if opts then options = vim.tbl_extend('force', options, opts) end

  -- vim.api.nvim_buf_set_keymap(bufnr, type, input, output, {noremap = true, silent = true})
  Mapper.map_buf(bufnr, type, input, output, options, category,
                 unique_identifier, description)
end

function nnoremap(input, output, category, unique_identifier, description,
                  options)
  noremap('n', input, output, category, unique_identifier, description, options)
end

function inoremap(input, category, unique_identifier, description, options)
  noremap('i', input, category, unique_identifier, description, options)
end

function vnoremap(input, category, unique_identifier, description, options)
  noremap('v', input, category, unique_identifier, description, options)
end

function xnoremap(input, category, unique_identifier, description, options)
  noremap('x', input, category, unique_identifier, description, options)
end

function onoremap(input, category, unique_identifier, description, options)
  noremap('o', input, category, unique_identifier, description, options)
end

function tnoremap(input, category, unique_identifier, description, options)
  noremap('t', input, category, unique_identifier, description, options)
end

function cnoremap(input, category, unique_identifier, description, options)
  noremap('c', input, category, unique_identifier, description, options)
end

function nmap(input, category, unique_identifier, description, options)
  map('n', input, category, unique_identifier, description, options)
end

function imap(input, category, unique_identifier, description, options)
  map('i', input, category, unique_identifier, description, options)
end

function vmap(input, category, unique_identifier, description, options)
  map('v', input, category, unique_identifier, description, options)
end

function xmap(input, category, unique_identifier, description, options)
  map('x', input, category, unique_identifier, description, options)
end

function omap(input, category, unique_identifier, description, options)
  map('o', input, category, unique_identifier, description, options)
end

function tmap(input, category, unique_identifier, description, options)
  map('t', input, category, unique_identifier, description, options)
end
