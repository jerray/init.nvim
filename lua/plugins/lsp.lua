return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      flags = {
        debounce_did_change_notify = 250,
      },
      diagnostics = {
        underline = true,
        update_in_insert = true,
      },
    },
  },
}
