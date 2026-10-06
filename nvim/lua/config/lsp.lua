vim.lsp.config("clangd", require("lsp.clangd"))
vim.lsp.enable({ "clangd" })

-- Inlay hints
vim.lsp.inlay_hint.enable(true)

-- LSP keymaps 
local M = {}

M.keys = {
  { mode = "n", lhs = "gd", rhs = vim.lsp.buf.definition, desc = "Go to definition" },
  { mode = "n", lhs = "gD", rhs = vim.lsp.buf.declaration, desc = "Go to declaration" },
  { mode = "n", lhs = "gr", rhs = vim.lsp.buf.references, desc = "Find references" },
  { mode = "n", lhs = "gi", rhs = vim.lsp.buf.implementation, desc = "Go to implementation" },
  { mode = "n", lhs = "K", rhs = vim.lsp.buf.hover, desc = "Hover documentation" },
  { mode = "n", lhs = "<C-k>", rhs = vim.lsp.buf.signature_help, desc = "Signature help" },
  { mode = "n", lhs = "<leader>rn", rhs = vim.lsp.buf.rename, desc = "Rename symbol" },
  { mode = { "n", "x" }, lhs = "<leader>ca", rhs = vim.lsp.buf.code_action, desc = "Code action" },
  {
    mode = "n",
    lhs = "[d",
    rhs = function() vim.diagnostic.jump({ count = -1, float = true }) end,
    desc = "Previous diagnostic",
  },
  {
    mode = "n",
    lhs = "]d",
    rhs = function() vim.diagnostic.jump({ count = 1, float = true }) end,
    desc = "Next diagnostic",
  },
  { mode = "n", lhs = "<leader>e", rhs = vim.diagnostic.open_float, desc = "Show diagnostic" },
}

function M.set_lsp_keymaps(bufnr)
  for _, k in ipairs(M.keys) do
    vim.keymap.set(k.mode, k.lhs, k.rhs, { buffer = bufnr, desc = "LSP: " .. k.desc, silent = true })
  end
end

return M
