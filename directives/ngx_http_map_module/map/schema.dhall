let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let Entry = https://prelude.dhall-lang.org/Map/Entry.dhall

let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let variable = c.variable

        let name = c.name

        let default =
              Optional/map
                Text
                Text
                (λ(value : Text) → "default ${value};")
                c.default

        let hostnames =
              if    c.hostnames
              then  Some (indent (n + 2) "hostnames;")
              else  None Text

        let volatile =
              if    c.volatile
              then  Some (indent (n + 2) "volatile;")
              else  None Text

        let entries =
              List/map
                (Entry Text Text)
                Text
                ( λ(before : Entry Text Text) →
                    indent (n + 2) "${before.mapKey} ${before.mapValue};"
                )
                c.entries

        let directives =
              List/unpackOptionals Text [ hostnames, volatile, default ]

        in  Text/concatSep
              "\n"
              [ indent n "map \$${variable} \$${name} {"
              , Text/concatSep "\n" (directives # entries)
              , indent n "}"
              ]

in  { Type = type, default, make }