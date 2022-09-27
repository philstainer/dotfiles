local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then return end

gitsigns.setup {
  status_formatter = nil -- Use default
}
