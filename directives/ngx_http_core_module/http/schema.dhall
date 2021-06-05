let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let indent = ../../../utils/indent.dhall

let if_modified_since = ../if_modified_since/schema.dhall

let index = ../../ngx_http_index_module/index/schema.dhall

let sendfile = ../sendfile/schema.dhall

let server = ../server/schema.dhall

let types = ../types/schema.dhall

let default_type = ../default_type/schema.dhall

let log_format = ../../ngx_http_log_module/log_format/schema.dhall

let map = ../../ngx_http_map_module/map/schema.dhall

let upstream = ../../ngx_http_upstream_module/upstream/schema.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let default_type =
              Optional/map
                default_type.Type
                Text
                (default_type.make (n + 2))
                c.default_type

        let if_modified_since =
              Optional/map
                if_modified_since.Type
                Text
                (if_modified_since.make (n + 2))
                c.if_modified_since

        let index = Optional/map index.Type Text (index.make (n + 2)) c.index

        let log_formats =
              List/map
                log_format.Type
                Text
                (log_format.make (n + 2))
                c.log_format

        let maps = List/map map.Type Text (map.make (n + 2)) c.maps

        let sendfile =
              Optional/map sendfile.Type Text (sendfile.make (n + 2)) c.sendfile

        let servers = List/map server.Type Text (server.make (n + 2)) c.servers

        let types = Optional/map types.Type Text (types.make (n + 2)) c.types

        let upstreams =
              List/map upstream.Type Text (upstream.make (n + 2)) c.upstreams

        let directives =
                List/unpackOptionals
                  Text
                  [ default_type, if_modified_since, index ]
              # log_formats
              # maps
              # List/unpackOptionals Text [ sendfile ]
              # servers
              # List/unpackOptionals Text [ types ]
              # upstreams

        in  Text/concatSep
              "\n"
              [ indent n "http {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  { Type = type, default, make }
