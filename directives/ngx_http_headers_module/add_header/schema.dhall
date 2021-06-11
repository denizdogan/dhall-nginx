let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let always = if c.always then " always" else ""

        in  indent n "add_header ${c.name} ${c.value}${always};"

in  directives.makeDirective type make ⫽ { default }
