local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
  },
  sections = {
    lualine_c = {
      {'filename', path = 1},
    },
  },
}
