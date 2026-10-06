---@type vim.lsp.Config
return {
  cmd = {
    vim.env.CLANGD_PATH or 'clangd',
    -- No background indexing: faster startup, less memory on large trees.
    '--background-index=false',
    '--completion-style=detailed',
    '--header-insertion=iwyu',
    '--function-arg-placeholders=false',
    -- Cap completion items to keep the popup usable.
    '--limit-results=50',
    -- Release unused memory back to the OS.
    '--malloc-trim',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = {
    '.clangd',
    'compile_commands.json',
    'compile_flags.txt',
    '.git',
  },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
  },
  on_init = function(client, init_result)
    if init_result.offsetEncoding then
      client.offset_encoding = init_result.offsetEncoding
    end
  end,
}
