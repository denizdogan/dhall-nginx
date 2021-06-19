let type = ./type.dhall

let show =
      λ(value : type) →
        merge { default = "default", json = "json", none = "none" } value

in  show
