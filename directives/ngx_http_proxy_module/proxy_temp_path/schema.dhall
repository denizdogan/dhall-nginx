let List/map = https://prelude.dhall-lang.org/List/map.dhall

let Text/concat = https://prelude.dhall-lang.org/Text/concat.dhall

let d = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let default = ./default.dhall

let type = ./type.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let path = value.path

        let levels =
              Text/concat
                ( List/map
                    Natural
                    Text
                    (λ(level : Natural) → " ${Natural/show level}")
                    value.levels
                )

        in  indent n "proxy_temp_path ${path}${levels};"

in  d.makeDirective type make ⫽ { default }
