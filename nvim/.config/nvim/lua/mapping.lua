local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Telescope mappings
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')

-- Nvim-Tree
map('n', '<leader>a', '<cmd>NvimTreeToggle<CR>')

-- Trouble
map('n', '<leader>tt', '<cmd>TroubleToggle<CR>')
map('n', '<leader>tw', '<cmd>TroubleToggle lsp_workspace_diagnostics<CR>')
map('n', '<leader>td', '<cmd>TroubleToggle lsp_document_diagnostics<CR>')
map('n', '<leader>tq', '<cmd>TroubleToggle quickfix<CR>')
map('n', '<leader>tr', '<cmd>TroubleToggle lsp_references<CR>')
