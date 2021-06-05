let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let indent = ../../../utils/indent.dhall

let access_log = ../../ngx_http_log_module/access_log/schema.dhall

let default_type = ../default_type/schema.dhall

let location = ../location/schema.dhall

let log_not_found = ../log_not_found/schema.dhall

let root = ../../ngx_http_core_module/root/schema.dhall

let server_name = ../server_name/schema.dhall

let tcp_nodelay = ../tcp_nodelay/schema.dhall

let index = ../../ngx_http_index_module/index/schema.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let access_log =
              Optional/map
                access_log.Type
                Text
                (access_log.make (n + 2))
                c.access_log

        let default_type =
              Optional/map
                default_type.Type
                Text
                (default_type.make (n + 2))
                c.default_type

        let index = Optional/map index.Type Text (index.make (n + 2)) c.index

        let location =
              List/map location.Type Text (location.make (n + 2)) c.location

        let log_not_found =
              Optional/map
                log_not_found.Type
                Text
                (log_not_found.make (n + 2))
                c.log_not_found

        let root = Optional/map root.Type Text (root.make (n + 2)) c.root

        let server_name =
              if    Natural/isZero (List/length Text c.server_name)
              then  None Text
              else  Some (server_name.make (n + 2) c.server_name)

        let tcp_nodelay = tcp_nodelay.opt (n + 2) c.tcp_nodelay

        let directives =
                List/unpackOptionals Text [ access_log, default_type, index ]
              # location
              # List/unpackOptionals
                  Text
                  [ log_not_found, root, server_name, tcp_nodelay ]

        in  Text/concatSep
              "\n"
              [ indent n "server {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  { Type = type, default, make }
