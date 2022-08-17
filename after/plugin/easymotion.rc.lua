
vim.g.EasyMotion_do_mapping = 0 -- Disable default mappings

-- Jump to anywhere you want with minimal keystrokes, with just one key binding.
-- `s{char}{label}`
-- nmap('<leader>s', '<Plug>(easymotion-overwin-f)')
-- or
-- `s{char}{char}{label}`
-- Need one more keystroke, but on average, it may be more comfortable.
nmap('<leader>s', '<Plug>(easymotion-overwin-f2)')

-- Turn on case-insensitive feature
vim.g.EasyMotion_smartcase = 1

-- JK motions: Line motions
map('<Leader>h', '<Plug>(easymotion-linebackward)')
map('<Leader>j', '<Plug>(easymotion-j)')
map('<Leader>k', '<Plug>(easymotion-k)')
map('<Leader>l', '<Plug>(easymotion-lineforward)')
