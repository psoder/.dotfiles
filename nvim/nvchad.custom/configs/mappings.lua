local M = {}

M.disabled = {
  n = {
    ["<C-d>"] = "",
    ["<C-u>"] = "",
  }
}

M.abc = {
  n = {
    ["<C-d>"] = {"<C-d>zz", "Half window up and center"},
    ["<C-u>"] = {"<C-u>zz", "Half window down and center"},
  },

  i = {},  
}

return M
