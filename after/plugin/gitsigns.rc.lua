local status, gitsigns = pcall("gitsigns")
if (not status) then return end

gitsigns.setup({
  current_line_blame = true
})
