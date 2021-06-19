let Map/map =
      https://prelude.dhall-lang.org/Map/map.dhall sha256:23e09b0b9f08649797dfe1ca39755d5e1c7cad2d0944bdd36c7a0bf804bde8d0

let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let List/map =
      https://prelude.dhall-lang.org/List/map.dhall sha256:dd845ffb4568d40327f2a817eb42d1c6138b929ca758d50bc33112ef3c885680

let Entry =
      https://prelude.dhall-lang.org/Map/Entry.dhall sha256:f334283bdd9cd88e6ea510ca914bc221fc2dab5fb424d24514b2e0df600d5346

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
