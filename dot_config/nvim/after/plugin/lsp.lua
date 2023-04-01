local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.g.ff = 1000 -- ms after which to run format fix
local on_attach_clangd = function(client, bufnr)
    on_attach(client, bufnr)
    -- HACK: this will format the code and schedule a %s/^M// to run after vim.g.ff miliseconds
    -- TODO: keep the search results / fix without hack
    local format_fix = function()
        vim.cmd("w")
        vim.cmd("Format")
        vim.defer_fn(function()
            vim.cmd("%s/\r//")
            vim.cmd([[execute "normal! \<c-o>"]])
        end, vim.g.ff)
    end
    vim.keymap.set('n', '<C-f>', format_fix)
end

local on_attach_general = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    on_attach(client, bufnr)
    vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format { async = true } end, bufopts)
end


require 'lspconfig'.clangd.setup {
    on_attach = on_attach_clangd,
    capabilities = capabilities,
}

require 'lspconfig'.pyright.setup {
    on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        on_attach(client, bufnr)
        vim.keymap.set('n', '<C-f>', '<cmd>Format<CR>', bufopts)
    end,
    capabilities = capabilities,
}

require 'lspconfig'.lua_ls.setup {
    on_attach = on_attach_general,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get
                globals = { 'vim' },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

require 'lspconfig'.bashls.setup {
    on_attach = on_attach_general,
    capabilities = capabilities,
}

require 'lspconfig'.elixirls.setup {
    on_attach = on_attach_general,
    capabilities = capabilities,
    cmd = { "elixir-ls" }
}
