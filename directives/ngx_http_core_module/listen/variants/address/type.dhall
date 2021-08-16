let Size = ../../../../../types/Size/type.dhall

in  { address : Text
    , accept_filter : Optional < dataready | httpready >
    , backlog : Optional Natural
    , bind : Bool
    , default_server : Bool
    , deferred : Bool
    , fastopen : Optional Natural
    , http2 : Bool
    , ipv6only : Optional Bool
    , port : Optional Natural
    , proxy_protocol : Bool
    , rcvbuf : Optional Size
    , reuseport : Bool
    , setfib : Optional Natural
    , sndbuf : Optional Size
    , so_keepalive : Optional < on | off >
    , ssl : Bool
    }
