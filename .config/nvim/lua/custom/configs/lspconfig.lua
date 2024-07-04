local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig.util"

-- Servers list including tailwindcss
local servers = { "tailwindcss", "eslint", "cssls", "prismals" }

-- Setup loop for the rest of the servers
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
      noErrorTruncation = true,
    }
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    }
  }
}

lspconfig.clangd.setup {
  filetypes = { "c", "cpp" }, -- Restrict clangd to C files only
  on_attach = function (client, bufnr)
    client.server_capabilites.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  -- Add any additional clangd-specific configurations here
}

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "gopls" },
  root_dir = util.root_pattern("go.mod", "go.work", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    }
  }
})
