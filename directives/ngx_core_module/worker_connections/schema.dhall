let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text = Natural/show value in indent n "worker_connections ${text};"

in  { Type = type, default, make }
