let size = ../../../utils/size.dhall

in  { accept_filter = None < dataready | httpready >
    , backlog = None Natural
    , bind = False
    , default_server = False
    , deferred = False
    , fastopen = None Natural
    , http2 = False
    , ipv6only = None Bool
    , proxy_protocol = False
    , rcvbuf = None size.Size
    , reuseport = False
    , setfib = None Natural
    , sndbuf = None size.Size
    , so_keepalive = None < on | off >
    , ssl = False
    }
