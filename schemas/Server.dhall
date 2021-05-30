let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let Text/spaces = https://prelude.dhall-lang.org/Text/spaces.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let List/concat = https://prelude.dhall-lang.org/List/concat.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Listen = ./Listen.dhall

let Location = ./Location.dhall

let type = ../types/Server.dhall

let default = ../defaults/Server.dhall

let makeServerName = λ(server : type) → "server_name ${server.name};"

let makeLogs =
      λ(server : type) →
        let access =
              if    server.log.access
              then  Some "access_log /var/log/nginx/${server.name}_access.log;"
              else  None Text

        let error =
              if    server.log.error
              then  Some "error_log /var/log/nginx/${server.name}_error.log;"
              else  None Text

        in  List/unpackOptionals Text [ access, error ]

let makeServerLocations =
      λ(server : type) →
        List/map Location.Type Text Location.make server.locations

in  { Type = type
    , default
    , make =
        λ(server : type) →
          let parts =
                Text/concatSep
                  "\n"
                  ( List/map
                      Text
                      Text
                      (λ(x : Text) → Text/spaces 4 ++ x)
                      ( List/concat
                          Text
                          [ [ makeServerName server, Listen.make server.listen ]
                          , makeLogs server
                          , makeServerLocations server
                          ]
                      )
                  )

          in  ''
              server {
              ${parts}
              }
              ''
    }
