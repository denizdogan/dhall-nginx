let Prelude = ../../Prelude.dhall

let Text/concat = Prelude.Text.concat

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
