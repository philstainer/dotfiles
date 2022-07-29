local present, packer = pcall(require, 'phil.packer_init')

if not present then return false end

local presentImpatient, impatient = pcall(require, 'impatient')

if presentImpatient then impatient.enable_profile() end

-- Compile and reload file
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('Packer', {clear = true}),
  pattern = 'plugins.lua',
  callback = function() vim.cmd('source <afile> | PackerCompile') end
})

return packer.startup {
  function(use)
    -- Lua caching
    use 'lewis6991/impatient.nvim'

    use {'wbthomason/packer.nvim', event = 'VimEnter'}

    use 'nvim-lua/plenary.nvim'

    use 'goolord/alpha-nvim' -- Home screen
    use 'kyazdani42/nvim-tree.lua' -- File explorer
    use 'j-hui/fidget.nvim' -- Lsp detail status

    use 'TimUntersberger/neogit' -- Git
    use 'ruifm/gitlinker.nvim' -- Git browser
    use 'rhysd/committia.vim' -- Git commit
    use 'sindrets/diffview.nvim' -- Git diff
    use 'rhysd/git-messenger.vim' -- Git commit viewer
    use 'lewis6991/gitsigns.nvim' -- Git signs e.g new, modified

    -- Github integration
    if vim.fn.executable 'gh' == 1 then
      use 'pwntester/octo.nvim'
      use 'nvim-telescope/telescope-github.nvim'
    end

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/popup.nvim'
    use {'nvim-telescope/telescope-fzy-native.nvim', run = 'make'}
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'nvim-telescope/telescope-hop.nvim'
    use 'nvim-telescope/telescope-symbols.nvim'
    use 'ThePrimeagen/git-worktree.nvim'

    -- nvim-mapper replacement?? folke/which-key.nvim
    use 'lazytanuki/nvim-mapper' -- Key mapper for easy viewing
    use 'ahmedkhalf/project.nvim' -- Telescope projects

    -- Complete
    use {'hrsh7th/nvim-cmp', event = 'InsertEnter'}
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'tamago324/cmp-zsh'
    use {'tzachar/cmp-tabnine', run = './install.sh'} -- AI code helper

    use {
      'windwp/nvim-autopairs', -- Auto close ({'<" etc..
      config = function() require('nvim-autopairs').setup {} end
    }

    --
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

    use 'jose-elias-alvarez/null-ls.nvim' -- Formatting

    -- Snippets
    use {'L3MON4D3/LuaSnip', requires = {'rafamadriz/friendly-snippets'}}

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() vim.cmd [[TSUpdate]] end
    }
    use 'nvim-treesitter/playground' -- Treesitter playground / debugger
    use 'windwp/nvim-ts-autotag' -- Auto close tags
    use 'haringsrob/nvim_context_vt' -- shows treesitter context in end of parenthesis
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Extra
    use 'numToStr/Comment.nvim' -- Comments
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use 'mbbill/undotree' -- Undo history

    use 'rrethy/vim-illuminate' -- Highlight matching words when cursor on it

    use 'numtostr/BufOnly.nvim' -- Easy delete buffers

    use 'karb94/neoscroll.nvim' -- Smooth scrolling

    use 'kevinhwang91/nvim-bqf' -- Better quick fix list

    use 'justinmk/vim-sneak' -- Easy movement (not sure about this one)

    -- Text Maniuplation
    use 'godlygeek/tabular' -- Quickly align text by pattern
    use 'tpope/vim-surround' -- Surround text objects easily

    use 'tpope/vim-repeat' -- Repeat actions
    use 'bkad/CamelCaseMotion' -- Allows to move by camelCase with w e
    use 'lukas-reineke/indent-blankline.nvim' -- Show indent lines
    use 'andymass/vim-matchup' -- Enchances %
    use 'folke/todo-comments.nvim' -- Todo Comments

    use 'MunifTanjim/nui.nvim'
    use 'vuki656/package-info.nvim' -- Package info

    -- use {
    --   'darrikonn/vim-gofmt',
    --   run = function() vim.cmd [[GoUpdateBinaries]] end
    --   -- do = ':GoUpdateBinaries'
    -- }

    -- Theming
    -- use 'gruvbox-community/gruvbox'
    -- use 'tjdevries/gruvbuddy.nvim'
    -- use 'navarasu/onedark.nvim'
    use 'marko-cerovac/material.nvim'

    use 'tjdevries/colorbuddy.nvim' -- Themeing
    use 'norcalli/nvim-colorizer.lua' -- preview hex colors

    use 'kyazdani42/nvim-web-devicons' -- Icons

    use 'nvim-lualine/lualine.nvim' -- Status line

  end,
  config = {luarocks = {python_cmd = 'python3'}, display = {}}
}
