let Interval = ../../../types/Interval/type.dhall

let Size = ../../../types/Size/type.dhall

in  { buffer = None Size
    , flush = None Interval
    , format = None ../../ngx_http_log_module/log_format/type.dhall
    , gzip = None Bool
    , gzipLevel = None Natural
    , `if` = None Text
    , path = Some "logs/access.log"
    }
