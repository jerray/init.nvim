vim.g.python3_host_prog = "/usr/local/bin/python3"

require('helpers')
require('settings')
require('plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end

if has("win32") then
  require('windows')
end
