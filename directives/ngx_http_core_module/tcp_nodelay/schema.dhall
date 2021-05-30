let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text = if value then "on" else "off"

        in  indent n "tcp_nodelay ${text};"

let opt =
      λ(n : Natural) → λ(v : Optional type) → Optional/map type Text (make n) v

in  { Type = type, default, make, opt }
