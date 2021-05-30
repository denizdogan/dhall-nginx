let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(value : type) →
        let text = Natural/show value in "worker_connections ${text};"

in  { Type = type, default, make }
