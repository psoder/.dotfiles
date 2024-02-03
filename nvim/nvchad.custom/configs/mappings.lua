local M = {}

M.disabled = {
  n = {
    ["<C-d>"] = "",
    ["<C-u>"] = "",
  }
}

M.abc = {
  n = {
    ["<C-d>"] = { "<C-d>zz", "Half window up and center" },
    ["<C-u>"] = { "<C-u>zz", "Half window down and center" },
    ["n"] = { "nzzzv", "Keep search term in middle" },
    ["N"] = { "Nzzzv", "Keep search term in middle" },
    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]] }
  },

  i = {},

  v = {
    ["K"] = { ":m '<-2<CR>gv=gv", "Move line up" },
    ["J"] = { ":m '>+1<CR>gv=gv", "Move line down" },
  },
}

return M
