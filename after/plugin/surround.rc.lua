local status, surround = pcall("nvim-surround")
if (not status) then return end

surround.setup()
