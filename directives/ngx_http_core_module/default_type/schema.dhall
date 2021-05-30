let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make = λ(n : Natural) → λ(value : type) → indent n "default_type ${value};"

in  { Type = type, default, make }
