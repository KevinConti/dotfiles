return {
  -- Conform: format on save
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd = "ConformInfo",
    keys = {
      { "<leader>cf", function() require("conform").format({ async = true }) end, desc = "Format buffer" },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        elixir = { "mix" },
        gleam = { "gleam" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
    },
  },

  -- nvim-lint: async linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "InsertLeave", "BufReadPost" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        elixir = { "credo" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
        callback = function()
          -- Only lint if the linter is available
          local ft = vim.bo.filetype
          local linters = lint.linters_by_ft[ft] or {}
          for _, name in ipairs(linters) do
            local linter = lint.linters[name]
            if linter and vim.fn.executable(linter.cmd) == 1 then
              lint.try_lint(name)
            end
          end
        end,
      })
    end,
  },
}
