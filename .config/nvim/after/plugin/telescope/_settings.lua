local ok, telescope = pcall(require, 'telescope')
if not ok then return end

local telescopeConfig = require('telescope.config')
local actions = require('telescope.actions')
local actionLayout = require('telescope.actions.layout')

-- Clone the default Telescope configuration
local vimgrep_arguments = {unpack(telescopeConfig.values.vimgrep_arguments)}

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, '--hidden')

-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, '--glob')
table.insert(vimgrep_arguments, '!.git/*')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-x>'] = false,
        ['<C-q>'] = actions.send_to_qflist,
        ['<C-c>'] = actions.close,
        -- ['<esc>'] = actions.close,
        ['?'] = actions.which_key,
        ['<C-space>'] = function(prompt_bufnr)
          local opts = {
            callback = actions.toggle_selection,
            loop_callback = actions.send_selected_to_qflist
          }
          require('telescope').extensions.hop._hop_loop(prompt_bufnr, opts)
        end,
        ['<C-w>'] = function() vim.api.nvim_input '<c-s-w>' end,
        ['<C-p>'] = actionLayout.toggle_preview
      },
      n = {['<C-c>'] = actions.close, ['<C-p>'] = actionLayout.toggle_preview}
    },
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    sorting_strategy = 'ascending',
    file_ignore_patterns = {
      '.backup', '.swap', '.langservers', '.session', '.undo', '*.git', '.git',
      'node_modules', 'vendor', '.cache', '.vscode-server', '.Desktop',
      '.Documents', 'classes', 'yarn.lock', 'package-lock.json'
    },
    prompt_prefix = '> ',
    selection_caret = '> ',
    entry_prefix = '  ',
    multi_icon = '<>',
    color_devicons = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,

    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    vimgrep_arguments = vimgrep_arguments -- `hidden = true` is not supported in text grep commands.
  },
  pickers = {
    -- Your special builtin config goes in here
    buffers = {sort_lastused = true, previewer = false, theme = 'dropdown'},
    find_files = {previewer = false, theme = 'dropdown'},
    git_files = {previewer = false, theme = 'dropdown'},
    registers = {theme = 'dropdown'},
    lsp_code_actions = {theme = 'cursor'},
    lsp_range_code_actions = {theme = 'cursor'}
  },
  extensions = {
    fzy_native = {override_generic_sorter = true, override_file_sorter = true},

    hop = {
      -- keys define your hop keys in order; defaults to roughly lower- and uppercased home row
      keys = {'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';'}, -- ... and more

      -- Highlight groups to link to signs and lines; the below configuration refers to demo
      -- sign_hl typically only defines foreground to possibly be combined with line_hl
      sign_hl = {'WarningMsg', 'Title'},

      -- optional, typically a table of two highlight groups that are alternated between
      line_hl = {'CursorLine', 'Normal'},

      -- options specific to `hop_loop`
      -- true temporarily disables Telescope selection highlighting
      clear_selection_hl = false,
      -- highlight hopped to entry with telescope selection highlight
      -- note: mutually exclusive with `clear_selection_hl`
      trace_entry = true,
      -- jump to entry where hoop loop was started from
      reset_selection = true
    },

    ['ui-select'] = {
      require('telescope.themes').get_dropdown {
        -- even more opts
      }
    }
  }
}

telescope.load_extension('fzy_native')

telescope.load_extension('mapper')

telescope.load_extension('projects')

if vim.fn.executable 'gh' == 1 then telescope.load_extension('gh') end

telescope.load_extension('ui-select')

telescope.load_extension('hop')

telescope.load_extension('git_worktree')
