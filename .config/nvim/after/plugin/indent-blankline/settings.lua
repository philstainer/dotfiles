local ok, indent_blankline = pcall(require, 'indent-blankline')
if not ok then return end

indent_blankline.setup {filetype_exclude = {'alpha'}}
