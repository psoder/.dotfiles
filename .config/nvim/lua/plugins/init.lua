return {
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
      vim.cmd.hi 'Comment gui=none'

      require('catppuccin').setup {
        transparent_background = true,
      }
    end,
  },

  {
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = function()
      -- typescript-tools only finds tsserver in a project's own node_modules or
      -- in a global npm install, so it never attaches in projects without a
      -- local typescript. Point it at the copy mise provisions (`npm:typescript`
      -- in .config/mise/config.toml) so TS/TSX always gets a language server.
      -- NOTE: this path takes priority over a project-local typescript, so a repo
      -- pinned to an older TS is still served by the mise version.
      -- NOTE: keep the wildcard out of expand() -- it globs its argument itself
      -- and returns an empty string when the pattern is filtered by 'suffixes'.
      local pattern = vim.fn.expand '~/.local/share/mise/installs/npm-typescript' .. '/*/node_modules/typescript/lib/tsserver.js'
      local found = vim.fn.glob(pattern, true, true)

      return {
        settings = {
          tsserver_path = found[#found],
          -- nvim-ts-autotag handles JSX closing tags for every filetype, so keep
          -- typescript-tools' own version off to avoid double-inserting.
          jsx_close_tag = { enable = false },
        },
      }
    end,
  },

  { -- Auto close/rename HTML & JSX tags
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'xml', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'svelte', 'vue' },
    opts = {},
  },
}
