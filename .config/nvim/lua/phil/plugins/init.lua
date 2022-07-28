local present, packer = pcall(require, 'phil.packer_init')

if not present then return false end

local presentImpatient, impatient = pcall(require, 'impatient')

if presentImpatient then impatient.enable_profile() end

return packer.startup {
  function(use)
    -- Lua caching
    use 'lewis6991/impatient.nvim'

    use {'wbthomason/packer.nvim', event = 'VimEnter'}
    use 'nvim-lua/plenary.nvim'

    -- UI 
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons' -- optional, for file icon
      },
      config = function() require 'phil.plugins.nvim-tree' end
    }
    use {
      "j-hui/fidget.nvim",
      config = function() require 'phil.plugins.fidget' end
    }
    use {
      'goolord/alpha-nvim',
      config = function() require 'phil.plugins.alpha' end,
      after = 'nvim-web-devicons'
    }

    -- Git
    use {"TimUntersberger/neogit"}

    -- Github integration
    if vim.fn.executable "gh" == 1 then use "pwntester/octo.nvim" end
    use "ruifm/gitlinker.nvim"

    use "rhysd/committia.vim"
    use "sindrets/diffview.nvim"

    use {"rhysd/git-messenger.vim"}

    use {
      'lewis6991/gitsigns.nvim',
      config = function() require 'phil.plugins.gitsigns' end
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        {'nvim-telescope/telescope-fzy-native.nvim', run = 'make'},
        'nvim-telescope/telescope-github.nvim',
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-hop.nvim",
        'nvim-telescope/telescope-symbols.nvim',
        'ThePrimeagen/git-worktree.nvim'
      },
      config = function() require 'phil.plugins.telescope' end,
      after = {'nvim-mapper', 'project.nvim', 'plenary.nvim'}
    }

    -- nvim-mapper replacement?? folke/which-key.nvim
    use {
      'lazytanuki/nvim-mapper',
      config = function() require 'phil.plugins.nvim-mapper' end
    }

    use {
      'ahmedkhalf/project.nvim',
      config = function() require 'phil.plugins.project' end
    }

    -- Complete
    use {
      'hrsh7th/nvim-cmp',
      config = function() require 'phil.plugins.nvim-cmp' end,
      event = 'InsertEnter'
    }
    use({'hrsh7th/cmp-buffer', after = 'nvim-cmp'})
    use({'hrsh7th/cmp-path', after = 'nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'})
    use({'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'})
    use "tamago324/cmp-zsh"
    use {
      'tzachar/cmp-tabnine',
      run = './install.sh',
      after = 'nvim-cmp',
      config = function() require 'phil.plugins.cmp-tabnine' end
    }
    use {
      "windwp/nvim-autopairs", -- Auto close ({'<" etc..
      config = function() require("nvim-autopairs").setup {} end
    }

    --
    -- LSP Autocomplete & Linters
    use {'neovim/nvim-lspconfig'}
    use 'nvim-lua/lsp-status.nvim'
    use 'tjdevries/lsp_extensions.nvim'
    use 'onsails/lspkind-nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'williamboman/nvim-lsp-installer' -- LSP Installer
    use 'jose-elias-alvarez/nvim-lsp-ts-utils' -- TS Utils
    use {
      'SmiteshP/nvim-navic',
      config = function() require 'phil.plugins.nvim-navic' end
    }
    use {
      'folke/trouble.nvim',
      config = function() require('phil.plugins.trouble') end
    }
    -- Tailwind highlighter
    use {'princejoogie/tailwind-highlight.nvim'}

    -- Formatting
    use {'jose-elias-alvarez/null-ls.nvim'}

    -- Snippets
    use({
      'L3MON4D3/LuaSnip',
      requires = {'rafamadriz/friendly-snippets'},
      config = function() require('phil.plugins.luasnip') end
    })

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/playground', -- Treesitter playground / debugger
        'windwp/nvim-ts-autotag' -- Auto close tags
      },
      config = function() require 'phil.plugins.treesitter' end,
      run = function() vim.cmd [[TSUpdate]] end
    }
    use 'haringsrob/nvim_context_vt' -- shows treesitter context in end of parenthesis

    -- Comments
    use {
      'numToStr/Comment.nvim',
      requires = {'JoosepAlviste/nvim-ts-context-commentstring'},
      config = function() require 'phil.plugins.comment' end,
      after = {'nvim-treesitter'}
    }

    use {
      'nvim-treesitter/nvim-treesitter-textobjects',
      config = function() require 'phil.plugins.treesitter-textobjects' end
    }

    -- Undo history
    use 'mbbill/undotree'

    -- highlight matching words when cursor on it
    use {
      'rrethy/vim-illuminate',
      config = function() require('phil.plugins.vim-illuminate') end
    }

    -- Deletes all buffers except current
    use 'numtostr/BufOnly.nvim'

    -- Smooth scrolling
    use {
      'karb94/neoscroll.nvim',
      config = function() require 'phil.plugins.neoscroll' end
    }

    -- Better quick fix list
    use {
      'kevinhwang91/nvim-bqf',
      config = function() require 'phil.plugins.nvim-bqf' end
    }

    use {
      'justinmk/vim-sneak',
      config = function() require 'phil.plugins.vim-sneak' end
    }

    -- Text Maniuplation
    use "godlygeek/tabular" -- Quickly align text by pattern
    use 'tpope/vim-surround' -- Surround text objects easily
    use 'tpope/vim-repeat' -- Repeat actions

    -- Allows to move by camelCase with w e
    use {
      'bkad/CamelCaseMotion',
      config = function() require 'phil.plugins.camelcasemotion' end
    }

    -- Show indent lines
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function() require 'phil.plugins.indent-blankline' end
    }

    -- Enchances %
    use {
      'andymass/vim-matchup',
      config = function() require 'phil.plugins.vim-matchup' end
    }

    use {
      'folke/todo-comments.nvim',
      config = function() require 'phil.plugins.todo-comments' end
    }

    use {
      'vuki656/package-info.nvim',
      requires = "MunifTanjim/nui.nvim",
      config = function() require 'phil.plugins.package-info' end
    } -- shows latest version on package.json files

    -- use {
    --   'darrikonn/vim-gofmt',
    --   run = function() vim.cmd [[GoUpdateBinaries]] end
    --   -- do = ':GoUpdateBinaries'
    -- }

    -- Theming
    -- use 'gruvbox-community/gruvbox'
    -- use 'tjdevries/gruvbuddy.nvim'
    -- use {'navarasu/onedark.nvim'}
    use 'marko-cerovac/material.nvim'
    use {
      'tjdevries/colorbuddy.nvim',
      config = function() require 'phil.plugins.colorbuddy' end
    }

    -- Color highlighter
    use {
      'norcalli/nvim-colorizer.lua',
      config = function() require 'phil.plugins.nvim-colorizer' end
    } -- preview hex colors

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Status Line
    use {
      'nvim-lualine/lualine.nvim',
      requires = {{'kyazdani42/nvim-web-devicons', opt = true}},
      config = function() require 'phil.plugins.lualine' end
    }

  end,
  config = {luarocks = {python_cmd = "python3"}, display = {}}
}
