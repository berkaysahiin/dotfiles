-- Better highlight and indent per language.
-- Parsers install on first open.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  -- Main branch does not support lazy-loading (see README).
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Installs missing parsers in the background, no-op if present.
    require("nvim-treesitter").install({
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "python",
      "json",
      "c",
      "cpp",
      "llvm",
      "markdown",
      "markdown_inline",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("config_treesitter", { clear = true }),
      -- start() errors without a parser, so only enable where we install one.
      pattern = {
        "lua",
        "vim",
        "bash",
        "python",
        "json",
        "c",
        "cpp",
        "llvm",
        "markdown",
      },
      callback = function()
        if pcall(vim.treesitter.start) then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = "config_treesitter",
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
