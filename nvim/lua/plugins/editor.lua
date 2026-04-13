return {
  -- Auto-close brackets/quotes
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Surround text objects (sa, sd, sr)
  {
    "echasnovski/mini.surround",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- Highlight TODO/FIXME/HACK comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  -- Auto-close/rename HTML & JSX tags
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },

  -- Inline color previews
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes = { "css", "html", "javascript", "typescript", "typescriptreact", "javascriptreact", "lua" },
      user_default_options = {
        tailwind = true,
        css = true,
        mode = "background",
      },
    },
  },
}
