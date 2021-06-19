let Entry =
      https://prelude.dhall-lang.org/Map/Entry.dhall sha256:f334283bdd9cd88e6ea510ca914bc221fc2dab5fb424d24514b2e0df600d5346

let List/map =
      https://prelude.dhall-lang.org/List/map.dhall sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

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
