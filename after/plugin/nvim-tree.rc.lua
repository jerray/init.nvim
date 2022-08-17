local status, nvimtree = pcall(require, "nvim-tree")
if (not status) then return end

require('helpers')

nvimtree.setup {
  renderer = {
    highlight_opened_files = "name",
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  }
}
map('<leader>n', ':NvimTreeToggle<cr>')

