let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let accept_mutex = ../accept_mutex/schema.dhall

let multi_accept = ../multi_accept/schema.dhall

let use = ../use/schema.dhall

let worker_connections = ../worker_connections/schema.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let accept_mutex = accept_mutex.opt c.accept_mutex (n + 2)

        let multi_accept = multi_accept.opt c.multi_accept (n + 2)

        let use = use.opt c.use (n + 2)

        let worker_connections =
              worker_connections.opt c.worker_connections (n + 2)

        let directives =
              List/unpackOptionals
                Text
                [ accept_mutex, multi_accept, use, worker_connections ]

        in      ''
                events {
                ''
            ++  Text/concatSep "\n" directives
            ++  ''

                }''

in  { Type = type, default, make }
