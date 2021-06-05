let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let empty = if value.if_not_empty then " if_not_empty" else ""

        in  indent n "fastcgi_param ${value.parameter} ${value.value}${empty};"

in  { Type = type, default, make }
