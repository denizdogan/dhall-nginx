let type = ./type.dhall

let show =
      λ(value : type) →
        merge { on = "on", off = "off", string = λ(s : Text) → s } value

in  show
