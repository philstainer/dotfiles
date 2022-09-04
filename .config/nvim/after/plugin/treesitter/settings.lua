local ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

ts_configs.setup {

  autotag = {enable = true},
  ensure_installed = {
    'typescript', 'html', 'tsx', 'lua', 'json', 'rust', 'css', 'javascript',
    'c_sharp', 'norg', 'graphql', 'prisma', 'bash', 'astro'
  },

  highlight = {enable = true},

  matchup = {enable = true},

  incremental_selection = {enable = true},

  context_commentstring = {
    enable = true,

    -- With Comment.nvim, we don't need to run this on the autocmd.
    -- Only run it in pre-hook
    enable_autocmd = false,

    config = {c = '// %s', lua = '-- %s'}
  },

  textobjects = {enable = true},

  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = true,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',

      -- This shows stuff like literal strings, commas, etc.
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?'
    }
  }
}
