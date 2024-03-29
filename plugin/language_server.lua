local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(client, bufnr)
end

nvim_lsp.tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false,
  cmd = { "typescript-language-server", "--stdio" }
})

nvim_lsp.gopls.setup({
  capabilities,
  on_attach,
})

nvim_lsp.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("rust-tools").setup({})
