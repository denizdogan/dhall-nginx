let Prelude = ../../../Prelude.dhall

let Map/map = Prelude.Map.map

let Text/concatSep = Prelude.Text.concatSep

let List/map = Prelude.List.map

let Entry = Prelude.Map.Entry

let type = ./type.dhall

let default = ./default.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(v : type) →
        let spaceSeparated =
              Map/map Text (List Text) Text (Text/concatSep " ") v

        let keySpaceValue =
              λ(e : Entry Text Text) → "${e.mapKey} ${e.mapValue};"

        let content =
              List/map (Entry Text Text) Text keySpaceValue spaceSeparated

        in      indent
                  n
                  ''
                  types {
                  ''
            ++  Text/concatSep
                  "\n"
                  (List/map Text Text (indent (n + 2)) content)
            ++  "\n"
            ++  indent n "}"

in  directives.makeDirective type make ⫽ { default }
