vim.g.Illuminate_ftblacklist = {'NvimTree'}

vim.cmd [[
  augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline
  augroup END
]]
