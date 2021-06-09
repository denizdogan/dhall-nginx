let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let accept_mutex = ../accept_mutex/schema.dhall

let multi_accept = ../multi_accept/schema.dhall

let worker_connections = ../worker_connections/schema.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let accept_mutex =
              Optional/map
                accept_mutex.Type
                Text
                (accept_mutex.make (n + 2))
                c.accept_mutex

        let multi_accept =
              Optional/map
                multi_accept.Type
                Text
                (multi_accept.make (n + 2))
                c.multi_accept

        let worker_connections =
              Optional/map
                worker_connections.Type
                Text
                (worker_connections.make (n + 2))
                c.worker_connections

        let directives =
              List/unpackOptionals
                Text
                [ accept_mutex, multi_accept, worker_connections ]

        in      ''
                events {
                ''
            ++  Text/concatSep "\n" directives
            ++  ''

                }''

in  { Type = type, default, make }
