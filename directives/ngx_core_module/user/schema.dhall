let type = ./type.dhall

let default = ./default.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let group =
              merge { Some = λ(g : Text) → " ${g}", None = "" } value.group

        in  indent n "user ${value.user}${group};"

in  directives.makeDirective type make ⫽ { default }
