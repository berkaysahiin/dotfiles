-- Requires Neovim >= 0.11 
if vim.fn.has("nvim-0.11") == 0 then
  vim.api.nvim_echo({ { "This config requires Neovim >= 0.11", "ErrorMsg" } }, true, {})
  return
end

require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
require("config.lsp-setup")
