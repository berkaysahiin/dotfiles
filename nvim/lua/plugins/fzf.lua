-- Main search for files and text.
return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostics disable: missing-fields
  opts = {},
  ---@diagnostics enable: missing-fields
  keys = {
    {
      "<C-F>",
      function()
        require("fzf-lua").files()
      end,
      desc = "Find files (fzf)",
      silent = true,
    },
    {
      "<C-S>",
      function()
        if vim.fn.executable("rg") == 0 then
          vim.notify("ripgrep (rg) not found", vim.log.levels.WARN)
          return
        end
        require("fzf-lua").live_grep()
      end,
      desc = "Live grep (fzf)",
      silent = true,
    },
  },
}
