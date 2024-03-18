local M = {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}

function M.config()
  local cmp_nvim_lsp = require "cmp_nvim_lsp"

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

  local lspconfig = require "lspconfig"

  lspconfig.bashls.setup {}

  lspconfig.clangd.setup {}
  lspconfig.cmake.setup {}

  lspconfig.rust_analyzer.setup{}

  lspconfig.html.setup {}
  lspconfig.cssls.setup {}

  lspconfig.tsserver.setup {}
  lspconfig.svelte.setup {}
  lspconfig.vuels.setup {
  }

  lspconfig.pyright.setup {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "off",
        }
      }
    }
  }

  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        format = {
          enable = false,
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.stdpath "config" .. "/lua"] = true,
          },
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }

  lspconfig.jsonls.setup {}
  lspconfig.yamlls.setup {}

  lspconfig.texlab.setup {}
end

return M
