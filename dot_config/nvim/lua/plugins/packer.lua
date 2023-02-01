return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'navarasu/onedark.nvim'
    use 'sainnhe/everforest'
    use 'morhetz/gruvbox'
    use "EdenEast/nightfox.nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use 'folke/tokyonight.nvim'
    use 'sainnhe/sonokai'

    use 'nvim-lualine/lualine.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'folke/trouble.nvim'

    use 'NyCodeGHG/presence.nvim'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use 'jiangmiao/auto-pairs'
    use 'kylechui/nvim-surround'
    -- use 'sagarrakshe/toggle-bool'

    use {
        "folke/todo-comments.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        }
    }

    use 'dstein64/vim-startuptime'

    use 'gbprod/yanky.nvim'
    use { 'mg979/vim-visual-multi', tag = 'master' }

    use 'mbbill/undotree'

    -- TODO: add everything from nvim-cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'uga-rosa/cmp-dictionary'
    use 'rafamadriz/friendly-snippets'

    use {'L3MON4D3/LuaSnip', tag = 'v1.*'}
    use 'saadparwaiz1/cmp_luasnip'

    use 'mhartington/formatter.nvim'
    use 'williamboman/mason.nvim'
    use 'neovim/nvim-lspconfig'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }


end)
