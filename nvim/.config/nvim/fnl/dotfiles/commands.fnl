(module dotfiles.commands
        {require {nvim aniseed.nvim}})

(nvim.ex.command :CD ":lcd %:p:h")
(nvim.ex.command "-complete=file" "-nargs=*" :DebugC "lua require 'dotfiles.plugins.dap.functions'.start_c_debugger({<f-args>}, 'lldb')")
(nvim.ex.command "-complete=file" "-nargs=*" :DebugRust "lua require 'dotfiles.plugins.dap.functions'.start_c_debugger({<f-args>}, 'lldb', 'rust-lldb')")
