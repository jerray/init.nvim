return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<right>", "<cmd>BufferLineCycleNext<cr>", desc = "Navigate to the next buffer" },
      { "<left>", "<cmd>BufferLineCyclePrev<cr>", desc = "Navigate to the prev buffer" },
    },
    opts = {
      options = {
        separator_style = "slant",
        always_show_bufferline = true,
        show_close_icon = false,
        show_buffer_close_icons = false,
        color_icons = true,
        diagnostics = true,
      },
    },
  },
}
