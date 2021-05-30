let Text/concatMap = https://prelude.dhall-lang.org/Text/concatMap.dhall

let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let Text/spaces = https://prelude.dhall-lang.org/Text/spaces.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let type = ../types/Upstream.dhall

let default = ../defaults/Upstream.dhall

let makeServer =
      λ(server : { address : Text, port : Natural }) →
        "server ${server.address}:${Natural/show server.port};"

in  { Type = type
    , default
    , make =
        λ(upstream : type) →
          let upstreams =
                Text/concatSep
                  "\n"
                  ( List/map
                      Text
                      Text
                      (λ(t : Text) → Text/spaces 4 ++ t)
                      ( List/map
                          { address : Text, port : Natural }
                          Text
                          makeServer
                          upstream.servers
                      )
                  )

          in  ''
              upstream ${upstream.name} {
              ${upstreams}
              }
              ''
    }
