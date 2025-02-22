local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

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

    use "MunifTanjim/nui.nvim"

    use 'stevearc/dressing.nvim'
    use 'rcarriga/nvim-notify'

    use 'm00qek/baleia.nvim'

    use 'folke/zen-mode.nvim'

    use 'nvim-tree/nvim-web-devicons'

    use 'nvim-lualine/lualine.nvim'

    use 'm4xshen/hardtime.nvim'
    use 'ThePrimeagen/vim-be-good'

    use 'Eandrju/cellular-automaton.nvim'
    use 'alec-gibson/nvim-tetris'

    use 'folke/which-key.nvim'

    use {
        'ggandor/leap.nvim',
        requires = { "tpope/vim-repeat" }
    }

    use 'nishigori/increment-activator'

    use 'nvimtools/hydra.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'folke/trouble.nvim'
    use 'gabrielpoca/replacer.nvim'

    use 'NyCodeGHG/presence.nvim'

    use 'tpope/vim-abolish'
    use 'vim-scripts/cmdalias.vim'

    use 'alker0/chezmoi.vim'
    use 'aserowy/tmux.nvim'

    use 'stevearc/oil.nvim'

    use 'jiangmiao/auto-pairs'
    use 'kylechui/nvim-surround'

    use 'ThePrimeagen/harpoon'

    use 'chrisgrieser/nvim-various-textobjs'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use {
        "folke/todo-comments.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        }
    }

    use 'farmergreg/vim-lastplace'

    use 'dstein64/vim-startuptime'
    use 'lewis6991/impatient.nvim'
    use 'pteroctopus/faster.nvim'

    use 'lambdalisue/suda.vim'
    use 'rootkiter/vim-hexedit'

    use 'gbprod/yanky.nvim'
    use { 'mg979/vim-visual-multi', tag = 'master' }

    use 'mbbill/undotree'

    use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }

    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'

    use 'Exafunction/codeium.vim'

    -- TODO: add everything from nvim-cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'uga-rosa/cmp-dictionary'
    use 'rafamadriz/friendly-snippets'

    use 'williamboman/mason.nvim'

    -- TODO: ultest? neotest?
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'nvim-neotest/nvim-nio'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'jay-babu/mason-nvim-dap.nvim'

    use { 'L3MON4D3/LuaSnip', tag = 'v1.*' }
    use 'saadparwaiz1/cmp_luasnip'
    use 'jose-elias-alvarez/null-ls.nvim'

    use 'danymat/neogen'

    use 'ThePrimeagen/refactoring.nvim'

    use 'https://gitlab.com/schrieveslaach/sonarlint.nvim'

    use 'Badhi/nvim-treesitter-cpp-tools'

    use 'simrat39/rust-tools.nvim'

    use 'mhartington/formatter.nvim'
    use 'neovim/nvim-lspconfig'
    use "MysticalDevil/inlay-hints.nvim"
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'nvim-treesitter/playground'

    use 'nvim-treesitter/nvim-treesitter-context'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
