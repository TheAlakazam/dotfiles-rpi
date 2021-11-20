local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(_, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = {noremap = true, silent = true}
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<leader>li',
                   '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>ls',
                   '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>lt',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>le',
                   '<cmd>lua vim.lsp.diagnostics.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>',
                   opts)

end

-- local function eslint_config_exists()
--     local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)
-- 
--     if not vim.tbl_isempty(eslintrc) then return true end
-- 
--     if vim.fn.filereadable("package.json") ~= 0 then
--         if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
--             return true
--         end
--     end
-- 
--     return false
-- end

local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

local sumneko_root_path = vim.fn.stdpath('cache') .. '/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name ..
                           "/lua-language-server"

local runtime_path = vim.split(package.path, ';')

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {version = "LuaJIT", path = runtime_path},
            diagnostics = {globals = {"vim"}},
            workspace = {library = vim.api.nvim_get_runtime_file("", true)}
        }
    },
    telemetry = {enable = false}
}

lspconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        on_attach(_, bufnr)
    end
}

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    formatCommand = "prettier_d_slim --stdin-filepath ${INPUT}",
    formatStdin = true
}

lspconfig.efm.setup {
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = true
        client.resolved_capabilities.goto_definition = false
        vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
    end,
    init_options = {documentFormatting = true},
    root_dir = function() return vim.fn.getcwd() end,
    settings = {
        languages = {
            lua = {{formatCommand = "lua-format -i", formatStdin = true}},
            javascript = {eslint},
            javascriptreact = {eslint},
            ["javascript.jsx"] = {eslint},
            typescript = {eslint},
            typescriptreact = {eslint},
            ["typescipt.tsx"] = {eslint}
        }
    },
    filetypes = {
        'lua', 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript',
        'typescriptreact', 'typescript.tsx'
    }
}
