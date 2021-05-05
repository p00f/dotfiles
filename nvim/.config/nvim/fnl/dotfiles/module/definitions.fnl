(module dotfiles.module.definitions
  {require {nvim aniseed.nvim
            core aniseed.core}})

(defn set-global [global_ value]
  "Sets a neovim global variable"
  (core.assoc nvim.g global_ value))

(let [globals
       {:indent_blankline_char ""
        :indent_blankline_context_patterns ["class" "function" "method" "repeat" "conditional"]
        :cphlang "cpp"
        :cpp_compile_command "g++ -D XOX solution.cpp -o cpp.out -g -O0"
        :dap_virtual_text "all frames"
        :indent_blankline_filetype_exclude [:clojure :fennel :dashboard :help "" :packer :Results :NeogitStatus]
        :indent_blankline_char_highlight_list [:Conceal]
        :neovide_window_floating_blur true
        :neovide_window_floating_opacity 0.7
        :cursorhold_updatetime 300  ;; shorter CursorHold, decoupled from updatetime
        :hardtime_default_on 0
        :gtfo#terminals {:unix "wezterm start --cwd "}
        :list_of_normal_keys ["h" "j" "k" "l" "-" "+" "<LEFT>" "<RIGHT>"]
        :AutoPairsMapCR false}]
  (each [global_ value (pairs globals)]
       (set-global global_ value)))
