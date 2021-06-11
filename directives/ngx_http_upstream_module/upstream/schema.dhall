let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let type = ./type.dhall

let default = ./default.dhall

let server = ../server/schema.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let directives =
              List/map server.Type Text (server.make (n + 2)) c.server

        in  Text/concatSep
              "\n"
              [ indent n "upstream ${c.name} {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  directives.makeDirective type make ⫽ { default, server }
