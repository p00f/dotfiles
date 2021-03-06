(module dotfiles.init
        {autoload {nvim aniseed.nvim}})

(require :dotfiles.definitions)
(require :dotfiles.packages)
(require :dotfiles.options)
(require :dotfiles.mappings)
(require :dotfiles.commands)
(require :dotfiles.autocmd)
(require :dotfiles.highlights)
(require :dotfiles.plugins.diagnostic)
