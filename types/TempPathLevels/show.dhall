let Prelude = ../../Prelude.dhall

let List/map = Prelude.List.map

let Text/concat = Prelude.Text.concat

let type = ./type.dhall

let show =
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

        in  "${path}${levels}"

in  show
