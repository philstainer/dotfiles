vim.g.mapleader = ' '

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchparen = 1

-- fold
vim.wo.foldcolumn = '0' -- defines 1 col at window left, to indicate folding

-- using treesitter for folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

local options = {
  -- laststatus = 3, -- Global status bar
  errorbells = false,
  hidden = true,
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = {"menuone", "noselect"}, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = false, -- highlight all matches on previous search pattern
  incsearch = true,
  ignorecase = false, -- ignore case in search patterns
  -- mouse = "a", -- allow the mouse to be used in neovim
  -- pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showmatch = true,
  -- showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  smarttab = true,
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  background = 'dark',
  timeoutlen = 400, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  undodir = vim.fn.expand('$HOME/.nvim/undodir'),
  updatetime = 50, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  softtabstop = 2,
  cursorline = false, -- highlight the current line
  relativenumber = true, -- set relative numbered lines
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = true, -- display lines as one long line
  scrolloff = 8, -- is one of my fav
  colorcolumn = '0', -- '80'
  path = vim.opt.path + '**',
  wildmenu = true,
  wildmode = {'longest', 'list', 'full'},
  wildignore = vim.opt.wildignore + {
    '*.pyc', '*build/*', '**/coverage/*', '**/node_modules/*', '**/android/*',
    '**/ios/*', '**/.git/*'
  },
  guicursor = '',
  nu = true,
  cursorcolumn = false,
  foldlevelstart = 99, -- start file with all folds opened
  list = true,
  listchars = 'eol:¬,tab:>·,trail:~,extends:>,precedes:<'
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do vim.opt[k] = v end
