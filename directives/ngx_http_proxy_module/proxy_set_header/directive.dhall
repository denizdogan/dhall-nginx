let Prelude = ../../../Prelude.dhall

let Entry = Prelude.Map.Entry

let List/map = Prelude.List.map

let Text/concatSep = Prelude.Text.concatSep

let d = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let make =
      λ(n : Natural) →
      λ(entries : type) →
        let makeLine =
              λ(e : Entry Text Text) →
                "proxy_set_header ${e.mapKey} ${e.mapValue};"

        let content = List/map (Entry Text Text) Text makeLine entries

        in  Text/concatSep "\n" (List/map Text Text (indent n) content)

in    d.makeDirective type make
    ⫽ { opt =
          λ(entries : type) →
          λ(n : Natural) →
            if    Natural/isZero (List/length (Entry Text Text) entries)
            then  None Text
            else  Some (make n entries)
      }
