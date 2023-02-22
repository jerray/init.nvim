local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup {}

local opts = { silent = true }

vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)

vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts) -- Rename
vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "gp", "<cmd>Lspsaga preview_definition<CR>", opts) -- Definition preview

-- Show line diagnostics
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
-- vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- Diagnsotic jump
vim.keymap.set("n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
