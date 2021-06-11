let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let List/null = https://prelude.dhall-lang.org/List/null.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let interval = ../../../utils/interval.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let address = value.address

        let backup = if value.backup then Some "backup" else None Text

        let down = if value.down then Some "down" else None Text

        let drain = if value.drain then Some "drain" else None Text

        let fail_timeout =
              Optional/map
                interval.Interval.Type
                Text
                ( λ(n : interval.Interval.Type) →
                    "fail_timeout=" ++ interval.Interval/show n
                )
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
                interval.Interval.Type
                Text
                ( λ(n : interval.Interval.Type) →
                    "slow_start=" ++ interval.Interval/show n
                )
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

in  { Type = type, default, make }
