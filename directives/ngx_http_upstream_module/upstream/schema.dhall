let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let type = ./type.dhall

let default = ./default.dhall

let server = ../server/schema.dhall

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

let makeMany = λ(n : Natural) → λ(c : List type) → List/map type Text (make n) c

in  { Type = type, default, make, makeMany, server }
