let Prelude = ../../../Prelude.dhall

let Text/concatSep = Prelude.Text.concatSep

let List/unpackOptionals = Prelude.List.unpackOptionals

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
