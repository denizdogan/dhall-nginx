let type = ./type.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make = λ(n : Natural) → λ(value : type) → indent n "internal;"

in  directives.makeDirective type make
