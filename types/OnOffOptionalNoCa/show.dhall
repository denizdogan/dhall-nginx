let type = ./type.dhall

let show =
      λ(value : type) →
        merge
          { on = "on"
          , off = "off"
          , optional = "optional"
          , optional_no_ca = "optional_no_ca"
          }
          value

in  show
