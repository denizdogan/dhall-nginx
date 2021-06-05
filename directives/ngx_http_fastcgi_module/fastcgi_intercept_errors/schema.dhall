let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text = if value then "on" else "off"

        in  indent n "fastcgi_intercept_errors ${text};"

in  { Type = type, default, make }
