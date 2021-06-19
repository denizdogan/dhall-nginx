let Size = ../Size/type.dhall

let Size/show = ../Size/show.dhall

let type = ./type.dhall

let show =
      λ(value : type) →
        merge
          { off = "off"
          , shared =
              λ(v : { name : Text, size : Size }) →
                "shared:${v.name}:${Size/show v.size}"
          }
          value

in  show
