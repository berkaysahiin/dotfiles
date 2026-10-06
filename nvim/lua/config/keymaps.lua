vim.keymap.set("n", "<C-B>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<C-F>", function()
  require("fzf-lua").files()

end, { desc = "Find files (fzf)" })

vim.keymap.set("n", "<C-S>", function()
  require("fzf-lua").live_grep()
end, { desc = "Live grep (fzf)", silent = true })

vim.keymap.set("n", "<C-T>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle terminal" })
vim.keymap.set("n", "<C-L>", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle diagnostics" })
