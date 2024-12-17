-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader><cr>", ":noh<cr>")

-- keymap.set("n", "<leader>bd", ":Bclose<cr>")
keymap.set("n", "<leader>ba", ":1,300 bd!<cr>")

-- Tab configuration
keymap.set("n", "<leader>tn", ":tabnew<cr>")
keymap.set("n", "<leader>te", ":tabedit")
keymap.set("n", "<leader>tc", ":tabclose<cr>")
keymap.set("n", "<leader>tm", ":tabremove")

keymap.set("n", "<leader>cd", ":cd %:p:h<cr>")

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
