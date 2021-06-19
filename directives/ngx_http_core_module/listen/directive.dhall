let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let Bool/show =
      https://prelude.dhall-lang.org/Bool/show.dhall sha256:f85f6d2d921c37a2122cb2e2f8a0170e305b699debd0e6df5ef3370d806b5f61

let d = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let Size = ../../../types/Size/type.dhall

let Size/show = ../../../types/Size/show.dhall

let default = ./default.dhall

let type = ./type.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let address = c.address

        let default_server =
              if c.default_server then Some "default_server" else None Text

        let ssl = if c.ssl then Some "ssl" else None Text

        let http2 = if c.http2 then Some "http2" else None Text

        let proxy_protocol =
              if c.proxy_protocol then Some "proxy_protocol" else None Text

        let setfib =
              merge
                { None = None Text
                , Some = λ(n : Natural) → Some "setfib=${Natural/show n}"
                }
                c.setfib

        let fastopen =
              merge
                { None = None Text
                , Some = λ(n : Natural) → Some "fastopen=${Natural/show n}"
                }
                c.fastopen

        let backlog =
              merge
                { None = None Text
                , Some = λ(n : Natural) → Some "backlog=${Natural/show n}"
                }
                c.backlog

        let rcvbuf =
              merge
                { None = None Text
                , Some = λ(n : Size) → Some "rcvbuf=${Size/show n}"
                }
                c.rcvbuf

        let sndbuf =
              merge
                { None = None Text
                , Some = λ(n : Size) → Some "sndbuf=${Size/show n}"
                }
                c.sndbuf

        let accept_filter =
              merge
                { None = None Text
                , Some =
                    λ(n : < dataready | httpready >) →
                      Some
                        (     ""
                          ++  merge
                                { dataready = "dataready"
                                , httpready = "httpready"
                                }
                                n
                        )
                }
                c.accept_filter

        let ipv6only =
              merge
                { None = None Text
                , Some = λ(n : Bool) → Some "ipv6only=${Bool/show n}"
                }
                c.ipv6only

        let so_keepalive =
              merge
                { None = None Text
                , Some =
                    λ(n : < on | off >) →
                      Some ("" ++ merge { on = "on", off = "off" } n)
                }
                c.so_keepalive

        let deferred = if c.deferred then Some "deferred" else None Text

        let bind = if c.bind then Some "bind" else None Text

        let reuseport = if c.reuseport then Some "reuseport" else None Text

        let params =
              List/unpackOptionals
                Text
                [ default_server
                , ssl
                , http2
                , proxy_protocol
                , setfib
                , fastopen
                , backlog
                , rcvbuf
                , sndbuf
                , accept_filter
                , deferred
                , bind
                , ipv6only
                , reuseport
                , so_keepalive
                ]

        let pars =
              if    Natural/isZero (List/length Text params)
              then  ""
              else  " " ++ Text/concatSep " " params

        in  indent n "listen ${address}${pars};"

in  d.makeDirective type make ⫽ { default }
