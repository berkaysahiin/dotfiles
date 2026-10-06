-- Gruber darker with small personal tweaks.
-- Strings stay plain, comments and folds stay italic.
local M = {}

function M.setup()
  require("gruber-darker").setup({
    bold = true,
    italic = {
      strings = false,
      comments = true,
      operators = false,
      folds = true,
    },
  })

  vim.cmd.colorscheme("gruber-darker")

  local function set_custom_hl()
    vim.api.nvim_set_hl(0, "@lsp.type.property", { link = "Normal" })
    vim.api.nvim_set_hl(0, "@lsp.type.property.cpp", { link = "Normal" })
    vim.api.nvim_set_hl(0, "@type.builtin", { link = "GruberDarkerYellowBold" })
    -- Theme lacks these groups, so define a subtle fallback.
    vim.api.nvim_set_hl(0, "LspReferenceText", { underline = true, bg = "#282828" })
    vim.api.nvim_set_hl(0, "LspReferenceRead", { underline = true, bg = "#282828" })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { underline = true, bg = "#282828" })
  end
  set_custom_hl()
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_custom_hl,
    desc = "Keep property highlight as Normal",
  })
end

return M
