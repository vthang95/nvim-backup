local nvim_lsp = require('lspconfig')
local navic = require("nvim-navic")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(client, bufnr)
  navic.attach(client, bufnr)
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

nvim_lsp.astro.setup({
  capabilities,
  on_attach
})

nvim_lsp.zls.setup({
  capabilities,
  on_attach
})

nvim_lsp.tailwindcss.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
  end
})

nvim_lsp.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
  on_attach = function(client, bufnr)
  end
})

nvim_lsp.yamlls.setup {
  settings = {
    yaml = {
      validate = true,
      -- disable the schema store
      schemaStore = {
        enable = false,
        url = "",
      },
      -- manually select schemas
      schemas = {
        kubernetes = "*.yaml",
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] = "roles/tasks/*.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = "*play*.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["https://json.schemastore.org/dependabot-2.0.json"] = ".github/dependabot.{yml,yaml}",
        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
      }
    }
  }
}

require("rust-tools").setup({})
