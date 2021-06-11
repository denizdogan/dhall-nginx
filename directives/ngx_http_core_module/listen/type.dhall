let size = ../../../utils/size.dhall

in  { address : Text
    , accept_filter : Optional < dataready | httpready >
    , backlog : Optional Natural
    , bind : Bool
    , default_server : Bool
    , deferred : Bool
    , fastopen : Optional Natural
    , http2 : Bool
    , ipv6only : Optional Bool
    , proxy_protocol : Bool
    , rcvbuf : Optional size.Size
    , reuseport : Bool
    , setfib : Optional Natural
    , sndbuf : Optional size.Size
    , so_keepalive : Optional < on | off >
    , ssl : Bool
    }
