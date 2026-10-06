vim.keymap.set("n", "<C-B>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file tree", silent = true })
vim.keymap.set("n", "<C-T>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle terminal", silent = true })
vim.keymap.set("n", "<C-L>", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle diagnostics", silent = true })
