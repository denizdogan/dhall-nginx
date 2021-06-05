let type = ../sendfile/type.dhall

let default = ../sendfile/default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text = if value then "on" else "off"

        in  indent n "log_not_found ${text};"

in  { Type = type, default, make }