let type = ./type.dhall

let show =
      λ(value : type) →
        merge { on = "on", off = "off", always = "always" } value

in  show
