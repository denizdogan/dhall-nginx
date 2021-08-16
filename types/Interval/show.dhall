let Text/concat =
      https://prelude.dhall-lang.org/Text/concat.dhall
        sha256:731265b0288e8a905ecff95c97333ee2db614c39d69f1514cb8eed9259745fc0

let type = ./type.dhall

let show =
      λ(ti : type) →
        let opt =
              λ(v : Optional Natural) →
              λ(u : Text) →
                merge
                  { None = "", Some = λ(s : Natural) → Natural/show s ++ u }
                  v

        in  Text/concat
              [ opt ti.years "y"
              , opt ti.months "M"
              , opt ti.weeks "w"
              , opt ti.days "d"
              , opt ti.hours "h"
              , opt ti.minutes "m"
              , opt ti.seconds "s"
              , opt ti.milliseconds "ms"
              ]

in  show
