let type = ./type.dhall

let default = ./default.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let variable = c.variable

        let value = merge { None = "", Some = λ(s : Text) → " ${s}" } c.value

        in  indent n "env ${variable}${value};"

in  directives.makeDirective type make ⫽ { default }
