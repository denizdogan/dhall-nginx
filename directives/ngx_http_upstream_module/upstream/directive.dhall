let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall
        sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall
        sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

let type = ./type.dhall

let default = ./default.dhall

let ntlm = ../ntlm/directive.dhall

let server = ../server/directive.dhall

let zone = ../zone/directive.dhall

let d = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let ntlm = ntlm.opt c.ntlm (n + 2)

        let servers = server.listOpt c.server (n + 2)

        let zone = zone.opt c.zone (n + 2)

        let directives = List/unpackOptionals Text [ ntlm, servers, zone ]

        in  Text/concatSep
              "\n"
              [ indent n "upstream ${c.name} {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  d.makeDirective type make ⫽ { default, server }
