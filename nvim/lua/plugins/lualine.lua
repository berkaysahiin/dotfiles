-- Status line at the bottom.
-- Shows branch and diagnostics.
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        globalstatus = true,
      },
      sections = {
        lualine_b = { "branch", "diff", "diagnostics" },
      },
    })
  end,
}
