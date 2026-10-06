return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("treesitter-context").setup({
      mode = "cursor",
      max_lines = 3,
    })
    vim.keymap.set("n", "[x", function()
      require("treesitter-context").go_to_context(vim.v.count1)
    end, { desc = "Jump to context" })
  end,
}
