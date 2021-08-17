let Prelude = ../../../Prelude.dhall

let Text/concatSep = Prelude.Text.concatSep

let List/unpackOptionals = Prelude.List.unpackOptionals

let accept_mutex = ../accept_mutex/directive.dhall

let accept_mutex_delay = ../accept_mutex_delay/directive.dhall

let debug_connection = ../debug_connection/directive.dhall

let multi_accept = ../multi_accept/directive.dhall

let use = ../use/directive.dhall

let worker_connections = ../worker_connections/directive.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let accept_mutex = accept_mutex.opt c.accept_mutex (n + 2)

        let accept_mutex_delay =
              accept_mutex_delay.opt c.accept_mutex_delay (n + 2)

        let debug_connection = debug_connection.opt c.debug_connection (n + 2)

        let multi_accept = multi_accept.opt c.multi_accept (n + 2)

        let use = use.opt c.use (n + 2)

        let worker_connections =
              worker_connections.opt c.worker_connections (n + 2)

        let directives =
              List/unpackOptionals
                Text
                [ accept_mutex
                , accept_mutex_delay
                , debug_connection
                , multi_accept
                , use
                , worker_connections
                ]

        in      ''
                events {
                ''
            ++  Text/concatSep "\n" directives
            ++  ''

                }''

in  { Type = type, default, make }
