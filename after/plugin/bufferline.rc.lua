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
    diagnostics = true,
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_visible = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
      bg = '#073642'
    }
  },
}

map('<right>', '<Cmd>BufferLineCycleNext<CR>')
map('<left>', '<Cmd>BufferLineCyclePrev<CR>')
