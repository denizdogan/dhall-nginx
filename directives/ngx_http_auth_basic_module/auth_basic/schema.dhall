let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let text = merge { off = "off", realm = λ(realm : Text) → realm } c

        in  indent n "auth_basic ${text};"

in  { Type = type, default, make }
