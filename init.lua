-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local opt = vim.opt
opt.completeopt = "menu,menuone,noinsert,popup"

require("lspconfig").pyright.setup({
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        autoImportCompletions = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
        venvPath = ".",
        venv = ".venv",
      },
    },
  },
})

vim.g.copilot_settings = { selectedCompletionModel = "gpt-4o-copilot-2025-04-03" }
