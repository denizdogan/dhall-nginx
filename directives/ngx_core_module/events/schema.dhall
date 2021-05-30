let List/map = https://prelude.dhall-lang.org/List/map.dhall

let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let indent = ../../../utils/indent.dhall

let accept_mutex = ../accept_mutex/schema.dhall

let multi_accept = ../multi_accept/schema.dhall

let worker_connections = ../worker_connections/schema.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let accept_mutex =
              merge
                { Some = λ(x : accept_mutex.Type) → Some (accept_mutex.make x)
                , None = None Text
                }
                c.accept_mutex

        let multi_accept =
              merge
                { Some = λ(x : multi_accept.Type) → Some (multi_accept.make x)
                , None = None Text
                }
                c.multi_accept

        let worker_connections =
              merge
                { Some =
                    λ(x : worker_connections.Type) →
                      Some (worker_connections.make x)
                , None = None Text
                }
                c.worker_connections

        let directives = [ accept_mutex, multi_accept, worker_connections ]

        let indented =
              List/map
                Text
                Text
                (indent (n + 2))
                (List/unpackOptionals Text directives)

        in      ''
                events {
                ''
            ++  Text/concatSep "\n" indented
            ++  ''

                }''

in  { Type = type, default, make }
