local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local sources = {
  null_ls.builtins.diagnostics.pyproject_flake8,
  null_ls.builtins.formatting.black,
}

null_ls.setup {
  sources = sources,
}
