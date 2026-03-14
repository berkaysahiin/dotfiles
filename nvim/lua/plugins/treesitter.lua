return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "python",
      "json",
      "cpp",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "cpp",
      callback = function()
        vim.api.nvim_buf_call(0, function()
          vim.fn.matchadd("Keyword", "\\<module\\>")
          vim.fn.matchadd("Keyword", "\\<export\\>")
          vim.fn.matchadd("Keyword", "\\<import\\>")

          vim.fn.matchadd("Type", "\\<module\\s\\+\\zs[a-zA-Z_][a-zA-Z0-9_.]*")
          vim.fn.matchadd("Type", "\\<import\\s\\+\\zs[a-zA-Z_][a-zA-Z0-9_.]*")
          vim.fn.matchadd("Type", "\\<export\\s\\+import\\s\\+\\zs[a-zA-Z_][a-zA-Z0-9_.]*")
        end)
      end,
    })
  end,
}
