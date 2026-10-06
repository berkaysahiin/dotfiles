-- Floating terminal window.
-- Toggle with Ctrl T, from normal and terminal mode.
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
  },
  keys = {
    { "<C-T>", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal", silent = true },
    {
      "<C-T>",
      "<C-\\><C-n><cmd>ToggleTerm direction=float<cr>",
      mode = "t",
      desc = "Toggle terminal",
      silent = true,
    },
  },
}
