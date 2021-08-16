let Prelude = ../../../Prelude.dhall

let Text/concatSep = Prelude.Text.concatSep

let List/unpackOptionals = Prelude.List.unpackOptionals

let Optional/map = Prelude.Optional.map

let Entry = Prelude.Map.Entry

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let optList = ../../../utils/optList.dhall

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
              optList
                (Entry Text Text)
                ( λ(before : Entry Text Text) →
                    indent (n + 2) "${before.mapKey} ${before.mapValue};"
                )
                c.entries

        let directives =
              List/unpackOptionals
                Text
                [ hostnames, volatile, default, entries ]

        in  Text/concatSep
              "\n"
              [ indent n "map \$${variable} \$${name} {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  directives.makeDirective type make ⫽ { default }
