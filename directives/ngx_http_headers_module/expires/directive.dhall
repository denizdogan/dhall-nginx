let directives = ../../../utils/directives.dhall

let Interval = ../../../types/Interval/type.dhall

let Interval/show = ../../../types/Interval/show.dhall

let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let default = ./default.dhall

let Expires = ./Expires.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let text =
              merge
                { epoch = "epoch"
                , max = "max"
                , off = "off"
                , addTime = Interval/show
                , subtractTime = λ(i : Interval) → "-${Interval/show i}"
                , timeOfDay = λ(i : Interval) → "@${Interval/show i}"
                , text = λ(t : Text) → t
                }
                c.time

        let modified = if c.modified then " modified" else ""

        in  indent n "expires${modified} ${text};"

in  directives.makeDirective type make ⫽ { default, Expires }
