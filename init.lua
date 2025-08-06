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

-- vim.g.neovide_cursor_vfx_mode = "ripple"
vim.g.neovide_opacity = 0.9
vim.g.neovide_scroll_animation_length = 0.2

-- vim.g.neovide_hide_titlebar = true

-- vim.g.neovide_macos_simple_fullscreen = true

-- 普通模式
vim.keymap.set("n", "<D-v>", '"+p')
-- 插入模式
vim.keymap.set("i", "<D-v>", "<C-r>+")
-- 视觉模式
vim.keymap.set("v", "<D-v>", '"+p')

if vim.g.neovide then
  vim.keymap.set("t", "<D-v>", function()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
  end, { silent = true })
end

vim.g.neovide_scale_factor = 1.2

vim.g.netrw_list_hide = "__pycache__,*.egg-info"

vim.keymap.set("n", "<Leader>fp", function()
  local rel = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":.")
  vim.fn.setreg("+", rel)
  print("Copied: " .. rel)
end, {
  noremap = true,
  silent = true,
  desc = "复制当前文件所在目录的相对路径到剪贴板",
})
