local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
      }
    }
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function ()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function ()
      opts = require("plugins.configs.treesitter")
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "css",
        "php",
      }
    end
  },
}

return plugins
