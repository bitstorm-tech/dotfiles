local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers =
  { "html", "cssls", "tsserver", "clangd", "templ", "tailwindcss", "gopls", "angularls", "yamlls", "bashls", "eslint" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig["htmx"].setup({
--   filetypes = { "html", "templ" }
-- })

lspconfig["html"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "templ" },
}

lspconfig["tailwindcss"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "templ" },
  init_options = {
    userLanguages = {
      templ = "html",
    },
  },
  settings = {
    includeLanguages = {
      templ = "html",
    },
  },
}

lspconfig["tsserver"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "js", "ts", "templ" },
}

lspconfig["eslint"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "ts", "js" },
}
