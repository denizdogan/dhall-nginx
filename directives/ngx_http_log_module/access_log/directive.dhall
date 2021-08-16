let Prelude = ../../../Prelude.dhall

let Text/concatSep = Prelude.Text.concatSep

let Optional/default = Prelude.Optional.default

let Bool/not = Prelude.Bool.not

let List/unpackOptionals = Prelude.List.unpackOptionals

let Optional/map = Prelude.Optional.map

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
