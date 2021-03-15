local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp_status = require("lsp-status")
local on_init = function(client)
    client.config.flags = {}
    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end
end
lsp_status.register_progress()
lsp_status.config({
    indicator_errors = "🚫",
    indicator_warnings = "⚠️",
    indicator_info = "ℹ️",
    indicator_hint = "💡",
    indicator_ok = "👌",
})

if vim.g.uivonim == 1 then
    local lsp_callbacks = require("uivonim/lsp").callbacks
    lspconfig.bashls.setup({
        callbacks = lsp_callbacks,
        capabilities = capabilities,
        on_init = on_init,
    })
    lspconfig.sumneko_lua.setup({
        cmd = {
            "/home/p00f/bin/lua-language-server/bin/Linux/lua-language-server",
            "/home/p00f/bin/lua-language-server/main.lua",
        },
        settings = {
            Lua = {
                -- runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
                diagnostics = { globals = { "vim" } },
                completion = { keywordSnippet = true },
            },
        },
        callbacks = lsp_callbacks,
        capabilities = capabilities,
        on_init = on_init,
    })
    lspconfig.clojure_lsp.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        callbacks = lsp_callbacks,
        on_init = on_init,
    })
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        callbacks = lsp_callbacks,
        on_init = on_init,
    })
    lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        callbacks = lsp_callbacks,
        on_init = on_init,
    })
else
    lspconfig.bashls.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        on_init = on_init,
    })
    lspconfig.sumneko_lua.setup({
        cmd = {
            "/home/p00f/bin/lua-language-server/bin/Linux/lua-language-server",
            "-E",
            "/home/p00f/bin/lua-language-server/main.lua",
        },
        settings = {
            Lua = {
                -- runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
                diagnostics = { globals = { "vim", "wezterm" } },
                completion = { keywordSnippet = true },
            },
        },
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        on_init = on_init,
    })
    lspconfig.clojure_lsp.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        on_init = on_init,
    })
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        on_init = on_init,
    })
    lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = lsp_status.on_attach,
        on_init = on_init,
    })
end
