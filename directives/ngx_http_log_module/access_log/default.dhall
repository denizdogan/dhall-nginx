let interval = ../../../utils/interval.dhall

let size = ../../../utils/size.dhall

in  { buffer = None size.Size
    , flush = None interval.Interval.Type
    , format = None Text
    , gzip = None Bool
    , gzipLevel = None Natural
    , `if` = None Text
    , path = Some "logs/access.log"
    }