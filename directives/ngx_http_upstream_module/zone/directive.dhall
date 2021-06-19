let default = ./default.dhall

let type = ./type.dhall

let d = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let Size = ../../../types/Size/type.dhall

let Size/show = ../../../types/Size/show.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let name = value.name

        let sz =
              merge
                { None = "", Some = λ(s : Size) → " ${Size/show s}" }
                value.size

        in  indent n "zone ${name}${sz};"

in  d.makeDirective type make ⫽ { default }
