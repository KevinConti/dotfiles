return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "elixirls",
        "marksman",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- On-attach keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gr", vim.lsp.buf.references, "References")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("K", vim.lsp.buf.hover, "Hover documentation")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
        end,
      })

      -- Servers configured via Mason
      local servers = { "ts_ls", "html", "cssls", "tailwindcss", "marksman" }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
      end

      -- ElixirLS (commented out in favor of Expert)
      -- vim.lsp.config("elixirls", {
      --   capabilities = capabilities,
      --   cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/elixir-ls") },
      --   root_markers = { "mix.exs" },
      -- })

      -- Expert: official Elixir LSP (https://github.com/elixir-lang/expert)
      -- Wrap in bash -c to source asdf so Expert can find elixir
      vim.lsp.config("expert", {
        capabilities = capabilities,
        cmd = { "bash", "-c", "source ~/.asdf/asdf.sh && exec ~/.local/bin/expert --stdio" },
        root_markers = { "mix.exs", ".git" },
        filetypes = { "elixir", "eelixir", "heex" },
      })

      -- Gleam LSP (ships with the gleam binary, not Mason)
      vim.lsp.config("gleam", { capabilities = capabilities })

      -- Enable all servers
      vim.lsp.enable(vim.list_extend(servers, { "expert", "gleam" }))
    end,
  },
}
