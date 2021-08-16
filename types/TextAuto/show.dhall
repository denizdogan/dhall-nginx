let Prelude = ../../Prelude.dhall

let Function/identity = Prelude.Function.identity

let type = ./type.dhall

let show =
      λ(v : type) → merge { auto = "auto", text = Function/identity Text } v

in  show
