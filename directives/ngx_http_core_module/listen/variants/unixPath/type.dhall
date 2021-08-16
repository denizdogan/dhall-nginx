let Size = ../../../../../types/Size/type.dhall

in  { unixPath : Text
    , accept_filter : Optional < dataready | httpready >
    , backlog : Optional Natural
    , bind : Bool
    , default_server : Bool
    , deferred : Bool
    , fastopen : Optional Natural
    , http2 : Bool
    , proxy_protocol : Bool
    , rcvbuf : Optional Size
    , setfib : Optional Natural
    , sndbuf : Optional Size
    , so_keepalive : Optional < on | off >
    , ssl : Bool
    }
