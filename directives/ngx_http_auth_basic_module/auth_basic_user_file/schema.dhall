let type = ./type.dhall

let indent = ../../../utils/indent.dhall

let make = λ(n : Natural) → λ(c : type) → indent n "auth_basic_user_file ${c};"

in  { Type = type, make }
