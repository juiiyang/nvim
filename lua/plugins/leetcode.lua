local leet_arg = "lc"
return {
  "kawre/leetcode.nvim",
  lazy = leet_arg ~= vim.fn.argv()[1],
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- required by telescope
    "MunifTanjim/nui.nvim",
    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    arg = leet_arg,
    cn = { -- leetcode.cn
      enabled = true, ---@type boolean
      translator = true, ---@type boolean
      translate_problems = true, ---@type boolean
    },
    lang = "golang",
    injector = {
      ["golang"] = {
        before = { "package lc" },
      },
    },
  },
  config = function(_, opts)
    require("leetcode").setup(opts)

    local keymap = vim.keymap.set
    local keymap_opts = { noremap = true, silent = true }

    local leetcode_keymaps = {
      { "m", "menu", "Leetcode Menu" },
      { "x", "exit", "Leetcode Exit" },
      { "c", "console", "Leetcode Console" },
      { "i", "info", "Leetcode Info" },
      { "t", "tabs", "Leetcode Tabs" },
      { "y", "yank", "Leetcode Yank" },
      { "l", "lang", "Leetcode Change Language" },
      { "r", "run", "Leetcode Run" },
      { "s", "submit", "Leetcode Submit" },
      { "R", "random", "Leetcode Random" },
      { "d", "daily", "Leetcode Daily" },
      { "L", "list", "Leetcode List" },
      { "o", "open", "Leetcode Open in Browser" },
      { "e", "reset", "Leetcode Reset" },
      { "a", "last_submit", "Leetcode Last Submit" },
      { "v", "restore", "Leetcode Restore Layout" },
    }

    for _, map in ipairs(leetcode_keymaps) do
      keymap(
        "n",
        "<leader>l" .. map[1],
        "<cmd>Leet " .. map[2] .. "<cr>",
        vim.tbl_extend("force", keymap_opts, { desc = map[3] })
      )
    end
  end,
}
