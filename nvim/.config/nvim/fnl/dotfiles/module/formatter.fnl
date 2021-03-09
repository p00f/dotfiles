(module dotfiles.module.formatter
  {require {formatter formatter}})

(formatter.setup
    {:filetype {:lua
                [(fn [] {:exe "stylua"
                         :args ["--config-path"
                                "~/.config/stylua.toml"
                                "-"]
                         :stdin true})]
                :cpp
                [(fn [] {:exe "clang-format"
                         :args ["--style"
                                "\"{BasedOnStyle: Google, IndentWidth: 4}\""]
                         :stdin true})]
                :java
                [(fn [] {:exe "google-java-format"
                         :args ["-"]
                         :stdin true})]
                :fennel
                [(fn [] {:exe "fnlfmt"
                         :args ["-"]
                         :stdin true})]
                :rust
                [(fn [] {:exe "rustfmt"
                         :args ["--emit stdout"]
                         :stdin true})]
                :sh
                [(fn [] {:exe "shfmt"
                         :args ["-i 4"]
                         :stdin true})]
                :zsh
                [(fn [] {:exe "shfmt"
                         :args ["-i 4"]
                         :stdin true})]}})
