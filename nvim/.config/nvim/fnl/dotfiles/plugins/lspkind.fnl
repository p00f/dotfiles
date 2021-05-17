(module dotfiles.plugins.lspkind
        {require {icons nvim-nonicons
                  lspkind lspkind}})

(lspkind.init
   {:with_text true
    :symbol_map {:Text (icons.get :typography)
                 :Method "ƒ"
                 :Function ""
                 :Constructor ""
                 :Variable (icons.get :variable)
                 :Class (icons.get :class)
                 :Interface (icons.get :interface)
                 :Module "{}"
                 :Property (icons.get :tools)
                 :Unit (icons.get :note)
                 :Value (icons.get :note)
                 :Enum (icons.get :list-unordered)
                 :Keyword (icons.get :list-unordered)
                 :Snippet (icons.get :snippet)
                 :Color (icons.get :heart)
                 :File (icons.get :file)
                 :Folder (icons.get :file-directory-outline)
                 :EnumMember (icons.get :list-unordered)
                 :Constant (icons.get :constant)
                 :Struct (icons.get :struct)
                 :TypeParameter (icons.get :type)
                 :Field (icons.get :field)
                 :Reference (icons.get :file-symlink-file)
                 :Event (icons.get :zap)}})
