let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text = if value then "on" else "off"

        in  indent n "multi_accept ${text};"

in  { Type = type, default, make }