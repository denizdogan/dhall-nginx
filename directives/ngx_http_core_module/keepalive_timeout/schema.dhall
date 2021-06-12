let indent = ../../../utils/indent.dhall

let interval = ../../../utils/interval.dhall

let Interval = interval.Interval.Type

let Interval/show = interval.Interval/show

let default = ./default.dhall

let type = ./type.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let timeout = Interval/show value.timeout

        let header_timeout =
              merge
                { None = "", Some = λ(i : Interval) → " " ++ Interval/show i }
                value.header_timeout

        in  indent n "keepalive_timeout ${timeout}${header_timeout};"

let d = ../../../utils/directives.dhall

in  d.makeDirective type make ⫽ { default }
