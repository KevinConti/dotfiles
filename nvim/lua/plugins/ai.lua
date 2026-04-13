return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI chat toggle" },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI actions" },
    { "<leader>ai", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "AI inline" },
  },
  opts = {
    strategies = {
      chat = { adapter = "openrouter" },
      inline = { adapter = "openrouter" },
    },
    adapters = {
      http = {
        openrouter = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            name = "openrouter",
            formatted_name = "OpenRouter",
            env = {
              api_key = function()
                return vim.fn.readfile(vim.fn.expand("~/.config/secrets/openrouter"))[1]
              end,
              url = "https://openrouter.ai",
              chat_url = "/api/v1/chat/completions",
              models_endpoint = "/api/v1/models",
            },
            schema = {
              model = { default = "qwen/qwen3.5-flash-02-23" },
            },
          })
        end,
      },
    },
  },
}
