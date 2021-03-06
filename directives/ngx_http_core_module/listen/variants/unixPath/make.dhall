let Prelude = ../../../../../Prelude.dhall

let Text/concatSep = Prelude.Text.concatSep

let List/unpackOptionals = Prelude.List.unpackOptionals

let Size = ../../../../../types/Size/type.dhall

let Size/show = ../../../../../types/Size/show.dhall

let type = ./type.dhall

in  λ(n : Natural) →
    λ(c : type) →
      let unixPath = c.unixPath

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
              , so_keepalive
              ]

      let pars =
            if    Natural/isZero (List/length Text params)
            then  ""
            else  " " ++ Text/concatSep " " params

      in  "${unixPath}${pars}"
