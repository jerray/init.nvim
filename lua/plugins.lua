-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('PACKER', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    -- UI
    use 'tjdevries/colorbuddy.nvim'
    use {
    	"catppuccin/nvim",
    	as = "catppuccin",
    	config = function()
    		require("catppuccin").setup {
    			flavour = "mocha" -- mocha, macchiato, frappe, latte
    		}
    		vim.api.nvim_command "colorscheme catppuccin"
    	end
    }

    use 'kyazdani42/nvim-web-devicons'
    use { 'akinsho/bufferline.nvim', tag = "v2.*" }
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-tree.lua'
    use 'petertriho/nvim-scrollbar'
    use 'folke/zen-mode.nvim'

    use 'lewis6991/gitsigns.nvim' -- git added/removed in sidebar + inline blame
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        require('nvim-treesitter.install').update({ with_sync = true })
      end,
    }
    use 'norcalli/nvim-colorizer.lua'

    -- Input and navigation helpers
    use 'easymotion/vim-easymotion'
    use 'tpope/vim-repeat'
    use 'terryma/vim-multiple-cursors'
    use 'windwp/nvim-autopairs'
    use { 'kylechui/nvim-surround', tag = "*" }
    use 'scrooloose/nerdcommenter'

    use { 'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}},
    }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'folke/trouble.nvim'

    -- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use { "glepnir/lspsaga.nvim", branch = "main" }
    use 'onsails/lspkind.nvim'
    use 'liuchengxu/vista.vim'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Auto completion
    use 'L3MON4D3/LuaSnip'
    use { 'hrsh7th/nvim-cmp', requires = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'saadparwaiz1/cmp_luasnip'},
    }}

    -- Developing Languages
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'

end)
