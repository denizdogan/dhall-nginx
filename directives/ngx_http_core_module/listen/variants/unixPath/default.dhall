let Size = ../../../../../types/Size/type.dhall

in  { accept_filter = None < dataready | httpready >
    , backlog = None Natural
    , bind = False
    , default_server = False
    , deferred = False
    , fastopen = None Natural
    , http2 = False
    , proxy_protocol = False
    , rcvbuf = None Size
    , setfib = None Natural
    , sndbuf = None Size
    , so_keepalive = None < on | off >
    , ssl = False
    }
