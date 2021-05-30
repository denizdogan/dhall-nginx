let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let Optional/default = https://prelude.dhall-lang.org/Optional/default.dhall

let Bool/not = https://prelude.dhall-lang.org/Bool/not.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let type = ./type.dhall

let default = ./default.dhall

let log_format = ../../ngx_http_log_module/log_format/schema.dhall

let indent = ../../../utils/indent.dhall

let interval = ../../../utils/interval.dhall

let size = ../../../utils/size.dhall

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
                size.Size
                Text
                (λ(s : size.Size) → "buffer=${size.Size/show s}")
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
                interval.Interval.Type
                Text
                ( λ(s : interval.Interval.Type) →
                    "flush=${interval.Interval/show s}"
                )
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

in  { Type = type, default, make }
