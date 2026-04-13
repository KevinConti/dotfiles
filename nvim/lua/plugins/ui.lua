return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        theme = "catppuccin",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = { char = "│" },
      scope = { enabled = true },
    },
  },

  -- Keybinding hints
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>f", group = "Find" },
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Code" },
        { "<leader>g", group = "Git" },
        { "<leader>s", group = "Search/Replace" },
        { "<leader>h", group = "Harpoon" },
        { "<leader>t", group = "Test" },
        { "<leader>d", group = "Debug" },
        { "<leader>a", group = "AI" },
        { "<leader>x", group = "Diagnostics" },
      },
    },
  },

  -- Buffer line (tab bar)
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
      { "<leader>bc", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
    },
    config = function()
      local highlights = require("catppuccin.special.bufferline").get_theme()()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          offsets = {
            { filetype = "neo-tree", text = "Explorer", highlight = "Directory", separator = true },
          },
        },
        highlights = highlights,
      })
    end,
  },

  -- Noice: modern UI for messages, cmdline, popups
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },

  -- Dressing: better vim.ui.select/input
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
