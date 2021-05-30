let interval = ../../../utils/interval.dhall

let size = ../../../utils/size.dhall

in  { buffer : Optional size.Size
    , flush : Optional interval.Interval.Type
    , format : Optional ../../ngx_http_log_module/log_format/type.dhall
    , gzip : Optional Bool
    , gzipLevel : Optional Natural
    , `if` : Optional Text
    , path : Optional Text
    }
