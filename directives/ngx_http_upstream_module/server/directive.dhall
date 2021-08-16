let Prelude = ../../../Prelude.dhall

let Text/concatSep = Prelude.Text.concatSep

let Optional/map = Prelude.Optional.map

let List/null = Prelude.List.null

let List/unpackOptionals = Prelude.List.unpackOptionals

let type = ./type.dhall

let default = ./default.dhall

let d = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let Interval = ../../../types/Interval/type.dhall

let Interval/show = ../../../types/Interval/show.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let address = value.address

        let backup = if value.backup then Some "backup" else None Text

        let down = if value.down then Some "down" else None Text

        let drain = if value.drain then Some "drain" else None Text

        let fail_timeout =
              Optional/map
                Interval
                Text
                (λ(n : Interval) → "fail_timeout=" ++ Interval/show n)
                value.fail_timeout

        let max_fails =
              Optional/map
                Natural
                Text
                (λ(n : Natural) → "max_fails=" ++ Natural/show n)
                value.max_fails

        let resolve = if value.resolve then Some "resolve" else None Text

        let route = value.route

        let service = value.service

        let slow_start =
              Optional/map
                Interval
                Text
                (λ(n : Interval) → "slow_start=" ++ Interval/show n)
                value.slow_start

        let weight =
              Optional/map
                Natural
                Text
                (λ(n : Natural) → "weight=" ++ Natural/show n)
                value.weight

        let params =
              List/unpackOptionals
                Text
                [ backup
                , down
                , drain
                , fail_timeout
                , max_fails
                , resolve
                , route
                , service
                , slow_start
                , weight
                ]

        let paramText =
              if    List/null Text params
              then  ""
              else  " " ++ Text/concatSep " " params

        in  indent n "server ${address}${paramText};"

in  d.makeDirective type make ⫽ { default }
