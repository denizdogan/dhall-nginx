let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let Optional/map =
      https://prelude.dhall-lang.org/Optional/map.dhall sha256:501534192d988218d43261c299cc1d1e0b13d25df388937add784778ab0054fa

let List/null =
      https://prelude.dhall-lang.org/List/null.dhall sha256:2338e39637e9a50d66ae1482c0ed559bbcc11e9442bfca8f8c176bbcd9c4fc80

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

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
