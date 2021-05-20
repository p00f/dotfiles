(module dotfiles.lsp
  {require {lspconfig lspconfig
            lsp-status lsp-status
            icons nvim-nonicons
            lspsaga lspsaga}})

(let [on-init (fn [client]
                (set client.config.flags [])
                (if (. "flags" client.config)
                    (tset client.config.flags "allow_incremental_sync" true)))
      capabilities (vim.lsp.protocol.make_client_capabilities)
      on_attach lsp-status.on_attach]

  (do (tset capabilities.textDocument.completion.completionItem "snippetSupport" true)
      (tset capabilities.textDocument.completion.completionItem "resolveSupport"
            {:properties ["documentation"
                          "detail"
                          "additionalTextEdits"]})

      (lsp-status.register_progress)
      (lsp-status.config
           {:indicator_errors (icons.get "stop")
            :indicator_warnings (icons.get "alert")
            :indicator_info "i"
            :indicator_hint "!"
            :indicator_ok "👌"
            :status_symbol ""
            :component_separator "|"})

      (lspconfig.clangd.setup
                {:capabilities capabilities
                 :on_attach on_attach
                 :on_init on-init
                 :handlers (lsp-status.extensions.clangd.setup)
                 :init_options {:clangdFileStatus true}
                 :cmd ["clangd" "--background-index" "--suggest-missing-includes" "--header-insertion=iwyu"]})

      (lspconfig.sumneko_lua.setup
                {:cmd [(vim.fn.expand
                         "/home/p00f/bin/lua-language-server/bin/Linux/lua-language-server")
                       "-E"
                       (vim.fn.expand
                         "/home/p00f/bin/lua-language-server/main.lua")]
                 :settings {:Lua {:diagnostics
                                    {:globals ["vim" "wezterm"]
                                     :completion {:keywordSnippet true}}
                                  :workspace
                                    {:library
                                       {(vim.fn.expand "$VIMRUNTIME/lua") true
                                        (vim.fn.expand "$VIMRUNTIME/lua/vim") true
                                        (vim.fn.expand "$VIMRUNTIME/lua/vim/lsp") true}}}}
                 :capabilities capabilities
                 :on_attach on_attach
                 :on_init on-init})

      (lspconfig.rust_analyzer.setup
                {:capabilities capabilities
                 :on_attach on_attach
                 :on_init on-init})
      (lspconfig.bashls.setup
                {:capabilities capabilities
                 :on_attach on_attach
                 :on_init on-init})
      (lspsaga.init_lsp_saga {:use_saga_diagnostic_sign false
                              :code_action_icon (icons.get "light-bulb")
                              :dianostic_header_icon (.. (icons.get "bug") " ")})))
