let type = ./type.dhall

let default = ./default.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text = merge { any = "any", all = "all" } value

        in  indent n "satisfy ${text};"

in    directives.makeDirective type make
    ⫽ { default, all = type.all, any = type.any }
