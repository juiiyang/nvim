return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff_lsp = {
          on_attach = function(client, bufnr)
            -- 禁用 ruff 的 hover 功能，避免与其他 LSP 冲突
            client.server_capabilities.hoverProvider = false
          end,
        },
      },
    },
  },
}
