local status, mason = pcall(require, "mason")
if (not status) then return end

mason.setup()

require("mason-lspconfig").setup {
  ensure_installed = { }
}
