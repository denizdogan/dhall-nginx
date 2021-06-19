let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

let accept_mutex = ../accept_mutex/directive.dhall

let multi_accept = ../multi_accept/directive.dhall

let use = ../use/directive.dhall

let worker_connections = ../worker_connections/directive.dhall

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
