let type = ./type.dhall

let indent = ../../../utils/indent.dhall

let make = λ(n : Natural) → λ(value : type) → indent n "load_module ${value};"

in  { Type = type, make }
