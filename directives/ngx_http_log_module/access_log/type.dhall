let Interval = ../../../types/Interval/type.dhall

let Size = ../../../types/Size/type.dhall

in  { buffer : Optional Size
    , flush : Optional Interval
    , format : Optional ../../ngx_http_log_module/log_format/type.dhall
    , gzip : Optional Bool
    , gzipLevel : Optional Natural
    , `if` : Optional Text
    , path : Optional Text
    }
