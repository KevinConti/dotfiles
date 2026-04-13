return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Adapters
    "nvim-neotest/neotest-jest",
    "jfpedroza/neotest-elixir",
  },
  keys = {
    { "<leader>tt", function() require("neotest").run.run() end, desc = "Run nearest test" },
    { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run test file" },
    { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Test summary" },
    { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Test output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel" },
    { "<leader>tx", function() require("neotest").run.stop() end, desc = "Stop test" },
    { "[t", function() require("neotest").jump.prev({ status = "failed" }) end, desc = "Previous failed test" },
    { "]t", function() require("neotest").jump.next({ status = "failed" }) end, desc = "Next failed test" },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npx jest",
        }),
        require("neotest-elixir"),
      },
    })
  end,
}
