-- Highlights other uses of word under cursor.
-- Uses LSP first, then treesitter.
return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      providers = { "lsp", "treesitter", "regex" },
      delay = 100,
      large_file_cutoff = 50000,
    })
  end,
}
