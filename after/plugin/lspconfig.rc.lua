local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

-- Mappings.
-- Most of these key mappings including key mappings in the `on_attach` function are taken place by lspsaga.
--
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- Set up completion using nvim_cmp with LSP source
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
client_capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local capabilities = require('cmp_nvim_lsp').default_capabilities(client_capabilities)

-- Lua
nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Python
nvim_lsp.pyright.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}


-- Vue
-- Enable take over mode
nvim_lsp.volar.setup {
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'vue', 'json'},
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    typescript = {
      tsdk = '/opt/homebrew/lib/node_modules/typescript/lib/'
    }
  },
}


-- Tailwindcss
nvim_lsp.tailwindcss.setup {
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "classList", "ngClass", "style", "tw" },
    },
  },
}

nvim_lsp.html.setup {
  capabilities = capabilities,
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}


-- PHP
nvim_lsp.intelephense.setup {}


-- Golang
nvim_lsp.gopls.setup{
  cmd = {'gopls'},
  -- for postfix snippets and analyzers
  capabilities = capabilities,
  settings = {
    gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
       },
       staticcheck = true,
      },
  },
  on_attach = on_attach,
}
