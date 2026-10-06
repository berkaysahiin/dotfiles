-- fzf needs ripgrep on PATH; warn instead of erroring on first use.
local function fzf_ok()
  if vim.fn.executable("rg") == 0 then
    vim.notify("ripgrep (rg) not found", vim.log.levels.WARN)
    return false
  end
  local ok, _ = pcall(require, "fzf-lua")
  if not ok then
    vim.notify("fzf-lua not installed", vim.log.levels.WARN)
    return false
  end
  return true
end

vim.keymap.set("n", "<C-B>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree", silent = true })
vim.keymap.set("n", "<C-F>", function()
  if not fzf_ok() then
    return
  end
  require("fzf-lua").files()
end, { desc = "Find files (fzf)", silent = true })

vim.keymap.set("n", "<C-S>", function()
  if not fzf_ok() then
    return
  end
  require("fzf-lua").live_grep()
end, { desc = "Live grep (fzf)", silent = true })

vim.keymap.set("n", "<C-T>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle terminal", silent = true })
vim.keymap.set("n", "<C-L>", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle diagnostics", silent = true })
