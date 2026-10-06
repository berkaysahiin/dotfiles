-- Soft indent lines in the background.
-- Highlights the block around the cursor.
return 
{
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        use_treesitter = true,
      },
      indent = {
        enable = true,
        use_treesitter = false,
        chars = { "·" }, -- dim indent marker
        style = { { fg = "#3a3a3a" } },
      },
    })
  end
}
