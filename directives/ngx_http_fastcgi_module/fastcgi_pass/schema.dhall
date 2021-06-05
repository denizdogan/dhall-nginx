let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let default = ./default.dhall

let make = λ(n : Natural) → λ(value : type) → indent n "fastcgi_pass ${value};"

in  { Type = type, default, make }
