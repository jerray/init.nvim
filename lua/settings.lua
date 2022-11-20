local g = vim.g
local o = vim.o

require('helpers')

g.mapleader = ","

-- General
o.history = 700
vim.cmd([[
  filetype plugin on
  filetype indent on
]])

o.autoread = true
o.pastetoggle = "<F8>"
o.colorcolumn = 120
o.clipboard = "unnamed"

-- User Interface
o.so = 7
o.wildmenu = true
o.ruler = true
o.cmdheight = 2
o.hid = true

o.backspace = "eol,start,indent"
o.whichwrap = "b,s,<,>,h,l"
o.ignorecase = true -- Ignore case when searching
o.smartcase = true
o.hlsearch = true -- Highlight search things
o.incsearch = true -- Make search act like search in modern browsers
o.lazyredraw = false -- Don't redraw while executing macros
o.magic = true -- Set magic on, for regular expressions
o.showmatch = true -- Show matching bracts when text indicator is over them
o.mat = 2 -- How many tenths of a second to blink

o.laststatus = 2 -- Always show status line
o.signcolumn = "yes" -- Always show sign column
o.number = true -- Show line number


-- Text, tab and indent related
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smarttab = true

o.linebreak = true
o.textwidth = 500
o.autoindent = true
o.smartindent = true
o.wrap = true
o.encoding = "utf8"
o.fileformats = "unix,mac,dos"

-- Colors
o.background = "dark"
o.termguicolors = true
o.cursorline = true
o.winblend = 0
o.wildoptions = 'pum'
o.pumblend = 5


-- Terminal Mode
tmap('<Esc>', '<C-\\><C-n>')


-- Map space to / (search) and c-space to ? (backwards search)
map('<space>', '/')
map('<c-space>', '?')
map('<leader><cr>', ':noh<cr>')

map('<leader>bd', ':Bclose<cr>')
map('<leader>ba', ':1,300 bd!<cr>')

-- Tab configuration
map('<leader>tn', ':tabnew<cr>')
map('<leader>te', ':tabedit')
map('<leader>tc', ':tabclose<cr>')
map('<leader>tm', ':tabremove')

map('<leader>cd', ':cd %:p:h<cr>')

vim.cmd([[
  command! Bclose call BufcloseCloseIt()
  function! BufcloseCloseIt()
     let l:currentBufNum = bufnr("%")
     let l:alternateBufNum = bufnr("#")

     if buflisted(l:alternateBufNum)
       buffer #
     else
       bnext
     endif

     if bufnr("%") == l:currentBufNum
       new
     endif

     if buflisted(l:currentBufNum)
       execute("bdelete! ".l:currentBufNum)
     endif
  endfunction
]])

o.switchbuf = "usetab"
o.showtabline = 2 -- Always show tabline

-- Tab size
local file_types_au = {
  {
    pattern = "yaml,json,javascript,typescript,css,scss,less,lua,html,typescriptreact,vue",
    callback = function()
      vim.o.shiftwidth = 2
      vim.o.tabstop = 2
      vim.o.autoindent = true
    end,
  },
  {
    pattern = "php,python",
    callback = function()
      vim.o.shiftwidth = 4
      vim.o.tabstop = 4
      vim.o.autoindent = true
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
