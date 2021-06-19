let Function/identity =
      https://prelude.dhall-lang.org/Function/identity.dhall sha256:f78b96792b459cb664f41c6119bd8897dd04353a3343521d436cd82ad71cb4d4

let type = ./type.dhall

let show =
      λ(v : type) → merge { auto = "auto", text = Function/identity Text } v

in  show
