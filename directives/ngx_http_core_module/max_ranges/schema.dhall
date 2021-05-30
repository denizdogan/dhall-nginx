let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text = Natural/show value in indent n "max_ranges ${text};"

in  { Type = type, default, make }
