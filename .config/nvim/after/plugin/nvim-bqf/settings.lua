local ok, bqf = pcall(require, 'bqf')
if not ok then return end

bqf.setup({
  auto_enable = true,
  auto_resize_height = true -- highly recommended enable
})
