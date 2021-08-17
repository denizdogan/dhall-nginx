let type = ./type.dhall

let show =
      λ(value : type) → merge { off = "off", string = λ(s : Text) → s } value

in  show
