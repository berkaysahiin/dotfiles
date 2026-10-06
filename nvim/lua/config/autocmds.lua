local lsp_group = vim.api.nvim_create_augroup("config_lsp", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(event)
    local buf = event.buf
    -- Skip scratch and preview buffers.
    -- Do not check buflisted here. fzf opens files unlisted at attach time
    -- and marks them listed later, so that check would skip real files.
    -- Checking buftype alone is enough.
    if vim.bo[buf].buftype ~= "" then
      return
    end
    require("config.lsp").set_lsp_keymaps(buf)
  end,
})
