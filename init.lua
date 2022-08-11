vim.g.python3_host_prog = "/usr/local/bin/python3"

require('helpers')
require('plugins')
require('settings')
require('lsp_config')


----------------------
-- Plugin settings
----------------------
-- lualine
require('lualine').setup {
  sections = {
    lualine_c = {
      {'filename', path = 1}
    }
  }
}


-- nvim-tree
require('nvim-tree').setup {
  renderer = {
    highlight_opened_files = "name",
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  }
}
map('<leader>n', ':NvimTreeToggle<cr>')


-- nvim-treesitter
-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })
---ENDWORKAROUND
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "lua", "javascript", "typescript", "go", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


-- Telescope
require('telescope').setup()
nmap('<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
nmap('<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nmap('<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap('<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")


-- Ctrl+Z on Windows
if vim.fn.has('win32') == 1 then
  nmap('<C-z>', '<nop>')
  imap('<C-z>', '<nop>')
  vmap('<C-z>', '<nop>')
  map('s', '<C-z>', '<nop>')
  map('x', '<C-z>', '<nop>')
  map('o', '<C-z>', '<nop>')
  cmap('<C-z>', '<nop>')
end


-- Tab size
local file_types_au = {
  {
    pattern = "yaml,json,javascript,typescript,css,scss,less,lua,python",
    callback = function()
      vim.o.shiftwidth = 2
      vim.o.tabstop = 2
    end,
  },
  {
    pattern = "php",
    callback = function()
      vim.o.shiftwidth = 4
      vim.o.tabstop = 4
    end,
  },
  {
    pattern = "go",
    callback = function()
      vim.o.expandtab = false
    end,
  },
}
for _, opts in pairs(file_types_au) do
    vim.api.nvim_create_autocmd("FileType", opts)
end

