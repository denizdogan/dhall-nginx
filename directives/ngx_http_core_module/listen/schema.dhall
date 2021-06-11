let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let Bool/show = https://prelude.dhall-lang.org/Bool/show.dhall

let d = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let size = ../../../utils/size.dhall

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
                , Some = λ(n : size.Size) → Some "rcvbuf=${size.Size/show n}"
                }
                c.rcvbuf

        let sndbuf =
              merge
                { None = None Text
                , Some = λ(n : size.Size) → Some "sndbuf=${size.Size/show n}"
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
