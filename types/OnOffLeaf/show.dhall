let type = ./type.dhall

let show =
      λ(value : type) → merge { on = "on", off = "off", leaf = "leaf" } value

in  show
