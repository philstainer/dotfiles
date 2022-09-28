local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') ..
                           '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Packer Impatient
local presentImpatient, impatient = pcall(require, 'impatient')
if presentImpatient then impatient.enable_profile() end

return require('packer').startup {
  function(use)
    use 'lewis6991/impatient.nvim'
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    use {'goolord/alpha-nvim', config = GET_CONFIG('alpha')} -- Home Screen
    use {'kyazdani42/nvim-tree.lua', config = GET_CONFIG('nvim-tree')} -- File tree
    use {'j-hui/fidget.nvim', config = GET_CONFIG('fidget')} -- Lsp detail status

    -- Git
    use {
      'TimUntersberger/neogit',
      requires = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'},
      config = GET_CONFIG('neogit')
    }

    use {'ruifm/gitlinker.nvim', config = GET_CONFIG('gitlinker')} -- Git browser
    use 'rhysd/git-messenger.vim' -- Git commit viewer
    use {'lewis6991/gitsigns.nvim', config = GET_CONFIG('gitsigns')} -- Git signs e.g new, modified

    -- Github integration
    if vim.fn.executable 'gh' == 1 then
      use 'pwntester/octo.nvim'
      use 'nvim-telescope/telescope-github.nvim'
    end

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      config = GET_CONFIG('telescope'),
      requires = {'nvim-lua/plenary.nvim'}
    }
    use 'nvim-lua/popup.nvim'
    use {'nvim-telescope/telescope-fzy-native.nvim', run = 'make'}
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'nvim-telescope/telescope-hop.nvim'
    use 'nvim-telescope/telescope-symbols.nvim'
    use 'ThePrimeagen/git-worktree.nvim'
    -- use 'nvim-telescope/telescope-file-browser.nvim'
    -- use 'danielpieper/telescope-tmuxinator.nvim'

    -- nvim-mapper replacement?? folke/which-key.nvim
    use 'lazytanuki/nvim-mapper' -- Key mapper for easy viewing
    use 'ahmedkhalf/project.nvim' -- Telescope projects

    -- LSP Autocomplete & Linters
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use 'tjdevries/lsp_extensions.nvim'
    use 'onsails/lspkind-nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'williamboman/nvim-lsp-installer' -- LSP Installer
    use 'jose-elias-alvarez/nvim-lsp-ts-utils' -- TS Utils
    use 'SmiteshP/nvim-navic'
    use 'folke/trouble.nvim'

    use 'princejoogie/tailwind-highlight.nvim' -- Tailwind highlighter

    use {'jose-elias-alvarez/null-ls.nvim', config = GET_CONFIG('null-ls')} -- Formatting

    -- CMP
    use {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      wants = {'LuaSnip'},
      config = GET_CONFIG('nvim-cmp'),
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'tamago324/cmp-zsh',
        {'tzachar/cmp-tabnine', run = './install.sh'}, -- AI code helper
        {
          'L3MON4D3/LuaSnip',
          wants = 'friendly-snippets',
          config = GET_CONFIG('luasnip')
        },
        'rafamadriz/friendly-snippets',
        'onsails/lspkind-nvim'
      }
    }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() vim.cmd [[TSUpdate]] end
    }
    use 'nvim-treesitter/playground' -- Treesitter playground / debugger
    use 'haringsrob/nvim_context_vt' -- shows treesitter context in end of parenthesis
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use {
      'romgrk/nvim-treesitter-context',
      config = GET_CONFIG('nvim-treesitter-context')
    }

    -- Extra
    use 'numToStr/Comment.nvim' -- Comments
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use 'mbbill/undotree' -- Undo history

    use 'rrethy/vim-illuminate' -- Highlight matching words when cursor on it

    use 'numtostr/BufOnly.nvim' -- Easy delete buffers

    use 'kevinhwang91/nvim-bqf' -- Better quick fix list

    -- Text Maniuplation
    use 'godlygeek/tabular' -- Quickly align text by pattern
    use 'tpope/vim-surround' -- Surround text objects easily

    use 'tpope/vim-repeat' -- Repeat actions
    use 'bkad/CamelCaseMotion' -- Allows to move by camelCase with w e
    use 'lukas-reineke/indent-blankline.nvim' -- Show indent lines
    use {'andymass/vim-matchup', config = GET_CONFIG('vim-matchup')} -- Enchances %
    use 'folke/todo-comments.nvim' -- Todo Comments

    use 'MunifTanjim/nui.nvim'

    -- Theming
    -- use 'gruvbox-community/gruvbox'
    -- use 'tjdevries/gruvbuddy.nvim'
    -- use 'navarasu/onedark.nvim'
    use {
      'tjdevries/colorbuddy.nvim',
      requires = {'marko-cerovac/material.nvim'}
    }

    use 'norcalli/nvim-colorizer.lua' -- preview hex colors

    use 'kyazdani42/nvim-web-devicons' -- Icons

    use 'nvim-lualine/lualine.nvim' -- Status line

    if packer_bootstrap then require('packer').sync() end
  end
}
