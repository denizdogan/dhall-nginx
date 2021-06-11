let type = ./type.dhall

let default = ./default.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let text = merge { off = "off", realm = λ(realm : Text) → realm } c

        in  indent n "auth_basic ${text};"

in  directives.makeDirective type make ⫽ { default }
