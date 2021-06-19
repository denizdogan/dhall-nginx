let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let Optional/default =
      https://prelude.dhall-lang.org/Optional/default.dhall sha256:5bd665b0d6605c374b3c4a7e2e2bd3b9c1e39323d41441149ed5e30d86e889ad

let Bool/not =
      https://prelude.dhall-lang.org/Bool/not.dhall sha256:723df402df24377d8a853afed08d9d69a0a6d86e2e5b2bac8960b0d4756c7dc4

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

let Optional/map =
      https://prelude.dhall-lang.org/Optional/map.dhall sha256:501534192d988218d43261c299cc1d1e0b13d25df388937add784778ab0054fa

let type = ./type.dhall

let default = ./default.dhall

let log_format = ../../ngx_http_log_module/log_format/directive.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let Interval = ../../../types/Interval/type.dhall

let Interval/show = ../../../types/Interval/show.dhall

let Size = ../../../types/Size/type.dhall

let Size/show = ../../../types/Size/show.dhall

let combinedLogFormat =
      log_format::{
      , name = "combined"
      , format =
          "\$remote_addr - \$remote_user [\$time_local] \"\$request\" \$status \$body_bytes_sent \"\$http_referer\" \"\$http_user_agent\""
      }

let makeSome =
      λ(value : type) →
      λ(path : Text) →
        let format =
              Optional/default log_format.Type combinedLogFormat value.format

        let buffer =
              Optional/map
                Size
                Text
                (λ(s : Size) → "buffer=${Size/show s}")
                value.buffer

        let gzip =
              merge
                { None = None Text
                , Some =
                    λ(b : Bool) →
                      if    Bool/not b
                      then  None Text
                      else  Some
                              ( merge
                                  { None = "gzip"
                                  , Some =
                                      λ(s : Natural) → "gzip=${Natural/show s}"
                                  }
                                  value.gzipLevel
                              )
                }
                value.gzip

        let flush =
              Optional/map
                Interval
                Text
                (λ(s : Interval) → "flush=${Interval/show s}")
                value.flush

        let `if` = Optional/map Text Text (λ(s : Text) → "if=${s}") value.`if`

        in  List/unpackOptionals
              Text
              [ Some path, Some format.name, buffer, gzip, flush, `if` ]

let make =
      λ(n : Natural) →
      λ(value : type) →
        let parts = merge { None = [ "off" ], Some = makeSome value } value.path

        in  indent n "access_log ${Text/concatSep " " parts};"

let schema = directives.makeDirective type make ⫽ { default }

in  schema ⫽ { off = schema::{ path = None Text } }
