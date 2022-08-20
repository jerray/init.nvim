-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- theme
    use 'olimorris/onedarkpro.nvim'

    use 'kyazdani42/nvim-web-devicons'
    use { 'akinsho/bufferline.nvim', tag = "v2.*" }
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'liuchengxu/vista.vim'
    use 'petertriho/nvim-scrollbar'
    use 'folke/zen-mode.nvim'

    use 'scrooloose/syntastic'
    use 'scrooloose/nerdcommenter'

    use { 'lewis6991/gitsigns.nvim', -- git added/removed in sidebar + inline blame
      requires = { 'nvim-lua/plenary.nvim' },
    }

    use 'easymotion/vim-easymotion'
    use 'tpope/vim-repeat'

    use { 'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    }
    use 'nvim-telescope/telescope-file-browser.nvim'

    use { 'kylechui/nvim-surround', tag = "*" }
    use 'Raimondi/delimitMate'
    use 'terryma/vim-multiple-cursors'
    use 'nathanaelkane/vim-indent-guides'

    use 'L3MON4D3/LuaSnip'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        require('nvim-treesitter.install').update({ with_sync = true })
      end,
    }

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use({ "glepnir/lspsaga.nvim", branch = "main" })
    use {'onsails/lspkind.nvim'}

    use { 'hrsh7th/nvim-cmp', requires = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'saadparwaiz1/cmp_luasnip'},
    }}

    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'

end)
