-- npm add --global eslint_d
local eslint = {
  lintCommand = 'eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}',
  -- lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {'%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m'},
  -- lintFormats = {"%f:%l:%c: %m"},
  formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  --formatCommand = 'prettierd "${INPUT}"',
  formatStdin = true
}

return eslint
