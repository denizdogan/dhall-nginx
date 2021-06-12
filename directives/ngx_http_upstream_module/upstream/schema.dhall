let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let type = ./type.dhall

let default = ./default.dhall

let server = ../server/schema.dhall

let zone = ../zone/schema.dhall

let d = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let servers = server.listOpt c.server (n + 2)

        let zone = zone.opt c.zone (n + 2)

        let directives = List/unpackOptionals Text [ servers, zone ]

        in  Text/concatSep
              "\n"
              [ indent n "upstream ${c.name} {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  d.makeDirective type make ⫽ { default, server }
