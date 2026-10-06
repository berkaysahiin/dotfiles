-- Space as main leader key.
vim.g.mapleader = " "

-- Backslash for local buffer maps.
vim.g.maplocalleader = "\\"

-- Rich colors in terminal.
vim.opt.termguicolors = true

-- Background for theme.
vim.opt.background = "dark"

-- Show line numbers.
vim.opt.number = true

-- Show distance to current line.
vim.opt.relativenumber = true

-- Merge signs into number column ("number" keeps gutter width fixed,
-- gitsigns/diagnostics overlay the number instead of shifting text).
vim.opt.signcolumn = "number"

-- Highlight line under cursor.
vim.opt.cursorline = true

-- Leave statusline empty, lualine takes over (with globalstatus=true
-- an empty 'statusline' avoids double-render on startup).
vim.opt.statusline = ""

-- No swap files, cleaner worktree.
vim.opt.swapfile = false


-- @

-- Default options for indentation. 
-- Sleuth should discover this from the project

-- Spaces instead of tabs.
vim.opt.expandtab = true
-- Tab shows as two spaces.
vim.opt.tabstop = 2
-- Backspace removes two spaces at once.
vim.opt.softtabstop = 2
-- Auto indent shifts by two spaces.
vim.opt.shiftwidth = 2

-- @

