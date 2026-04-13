local parsers = {
  "bash",
  "css",
  "elixir",
  "gleam",
  "heex",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter").setup({})

    -- Enable treesitter highlighting for all buffers
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- Auto-install missing parsers when entering a buffer
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local ft = vim.bo.filetype
        local lang = vim.treesitter.language.get_lang(ft) or ft
        local installed = require("nvim-treesitter.config").get_installed()
        if vim.tbl_contains(parsers, lang) and not vim.tbl_contains(installed, lang) then
          require("nvim-treesitter.install").install({ lang })
        end
      end,
    })

    -- Install all desired parsers now
    local installed = require("nvim-treesitter.config").get_installed()
    local to_install = vim.tbl_filter(function(p)
      return not vim.tbl_contains(installed, p)
    end, parsers)
    if #to_install > 0 then
      require("nvim-treesitter.install").install(to_install)
    end
  end,
}
