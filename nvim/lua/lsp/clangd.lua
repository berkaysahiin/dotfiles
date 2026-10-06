---@type vim.lsp.Config
return {
  cmd = {
    vim.env.CLANGD_PATH or 'clangd',
    '--background-index=false', 
    '--completion-style=detailed',
    '--header-insertion=iwyu',
    '--function-arg-placeholders=false',
    '--limit-results=50',
    '--malloc-trim',
    '--experimental-modules-support', 
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
