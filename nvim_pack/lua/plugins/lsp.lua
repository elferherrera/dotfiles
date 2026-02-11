vim.lsp.enable({ 'lua_ls', 'ty', 'ruff', 'gopls', 'rust_analyzer', 'nushell' })

vim.diagnostic.config { virtual_text = true }

vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Code format' })
vim.keymap.set('n', 'grd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'grs', vim.lsp.buf.document_symbol, { desc = 'List of symbols in document' })
vim.keymap.set('n', 'grS', vim.lsp.buf.workspace_symbol , { desc = 'List of symbols in workspace' })
vim.keymap.set('n', 'gre', vim.diagnostic.setloclist, { desc = 'List of buffer errors from diagnostic' })
vim.keymap.set('n', 'grE', vim.diagnostic.setqflist, { desc = 'List of workspace errors from diagnostic' })

-- Use this only if you don't want to use blink for auto completion
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client ~= nil and client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--     end
--   end,
-- })
