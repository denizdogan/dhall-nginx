let type = ./type.dhall

let Size = ../Size/type.dhall

let Size/show = ../Size/show.dhall

let show =
      λ(value : type) →
        merge
          { off = "off"
          , none = "none"
          , builtin = λ(v : Size) → "builtin:${Size/show v}"
          , shared =
              λ(v : { name : Text, size : Size }) →
                "shared:${v.name}:${Size/show v.size}"
          }
          value

in  show
