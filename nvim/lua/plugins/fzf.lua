-- Main search for files and text.
local function fzf_ok()
  if vim.fn.executable("rg") == 0 then
    vim.notify("ripgrep (rg) not found", vim.log.levels.WARN)
    return false
  end
  return true
end

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
        if fzf_ok() then
          require("fzf-lua").files()
        end
      end,
      desc = "Find files (fzf)",
      silent = true,
    },
    {
      "<C-S>",
      function()
        if fzf_ok() then
          require("fzf-lua").live_grep()
        end
      end,
      desc = "Live grep (fzf)",
      silent = true,
    },
  },
}
