let List/map =
      https://prelude.dhall-lang.org/List/map.dhall sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Text/concat =
      https://prelude.dhall-lang.org/Text/concat.dhall sha256:731265b0288e8a905ecff95c97333ee2db614c39d69f1514cb8eed9259745fc0

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
