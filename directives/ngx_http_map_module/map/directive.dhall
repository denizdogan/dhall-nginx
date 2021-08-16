let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall
        sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall
        sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

let Optional/map =
      https://prelude.dhall-lang.org/Optional/map.dhall
        sha256:501534192d988218d43261c299cc1d1e0b13d25df388937add784778ab0054fa

let Entry =
      https://prelude.dhall-lang.org/Map/Entry.dhall
        sha256:f334283bdd9cd88e6ea510ca914bc221fc2dab5fb424d24514b2e0df600d5346

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
