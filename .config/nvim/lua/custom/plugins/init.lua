-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {
        git = {
          enable = true,
          ignore = false,
        },
      }
    end,
    keys = {
      { '<leader>ft', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree' },
    },
  },

  {
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    'ziglang/zig.vim',
    lazy = true,
    init = function()
      --
    end,
  },

  {
    'nyoom-engineering/oxocarbon.nvim',
    lazy = false,
    init = function()
      vim.cmd.colorscheme 'oxocarbon'

      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
