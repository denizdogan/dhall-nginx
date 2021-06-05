let interval = ../../../utils/interval.dhall

let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let text =
              merge
                { epoch = "epoch"
                , max = "max"
                , off = "off"
                , addTime = interval.Interval/show
                , subtractTime =
                    λ(i : interval.Interval.Type) →
                      "-${interval.Interval/show i}"
                , timeOfDay =
                    λ(i : interval.Interval.Type) →
                      "@${interval.Interval/show i}"
                , text = λ(t : Text) → t
                }
                c.time

        let modified = if c.modified then " modified" else ""

        in  indent n "expires${modified} ${text};"

in  { Type = type, default, make }
