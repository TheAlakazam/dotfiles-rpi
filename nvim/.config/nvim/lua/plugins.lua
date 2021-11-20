vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- LSP Stuff
    use 'neovim/nvim-lspconfig'
    use {
        'ray-x/lsp_signature.nvim',
        config = function() require('lsp_signature').setup {} end
    }
    use 'onsails/lspkind-nvim'
    use {
        'folke/trouble.nvim',
        config = function() require("trouble").setup {} end
    }

    -- Autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline', 'hrsh7th/cmp-vsnip'
        }
    }

    -- Telescope
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- Snippets
    use 'hrsh7th/vim-vsnip'

    -- Nvim Tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('nvim-tree').setup {} end
    }

    -- Colorscheme
    use {'dracula/vim', as = "dracula"}

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

end)
