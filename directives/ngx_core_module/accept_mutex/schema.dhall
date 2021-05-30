let type = ./type.dhall

let default = ./default.dhall

let make =
      \(value : type) ->
        let text = if value then "on" else "off" in "accept_mutex ${text};"

in  { Type = type, default, make }
