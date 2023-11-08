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

    use 'stevearc/dressing.nvim'
    use 'rcarriga/nvim-notify'

    use 'nvim-tree/nvim-web-devicons'

    use 'nvim-lualine/lualine.nvim'

    use 'folke/which-key.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'folke/trouble.nvim'

    use 'NyCodeGHG/presence.nvim'

    use 'vim-scripts/cmdalias.vim'

    use 'alker0/chezmoi.vim'
    use 'aserowy/tmux.nvim'

    use 'stevearc/oil.nvim'

    use 'jiangmiao/auto-pairs'
    use 'kylechui/nvim-surround'

    use {
        "folke/todo-comments.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        }
    }

    use 'dstein64/vim-startuptime'
    use 'lewis6991/impatient.nvim'
    use 'lambdalisue/suda.vim'
    use 'rootkiter/vim-hexedit'

    use 'gbprod/yanky.nvim'
    use { 'mg979/vim-visual-multi', tag = 'master' }

    use 'mbbill/undotree'

    use 'lewis6991/gitsigns.nvim'
    use 'kdheepak/lazygit.nvim'
    use 'NeogitOrg/neogit'

    use 'Exafunction/codeium.vim'
    -- TODO: add everything from nvim-cmp
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'uga-rosa/cmp-dictionary'
    use 'rafamadriz/friendly-snippets'

    use { 'L3MON4D3/LuaSnip', tag = 'v1.*' }
    use 'saadparwaiz1/cmp_luasnip'
    use 'jose-elias-alvarez/null-ls.nvim'

    use 'danymat/neogen'

    use 'https://gitlab.com/schrieveslaach/sonarlint.nvim'

    use 'simrat39/rust-tools.nvim'

    use 'mhartington/formatter.nvim'
    use 'williamboman/mason.nvim'
    use 'neovim/nvim-lspconfig'
    use 'simrat39/inlay-hints.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'nvim-treesitter/nvim-treesitter-context'

    if packer_bootstrap then
        require('packer').sync()
    end

end)
