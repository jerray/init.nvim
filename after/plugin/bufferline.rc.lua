local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

require('helpers')

bufferline.setup {
  options = {
    separator_style = "padded_slant",
    always_show_bufferline = true,
    show_close_icon = false,
    show_buffer_close_icons = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
  },
}

map('<right>', '<Cmd>BufferLineCycleNext<CR>')
map('<left>', '<Cmd>BufferLineCyclePrev<CR>')
