let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let files = Text/concatSep " " value.files

        let uri = value.uri

        in  indent n "try_files ${files} ${uri};"

in  { Type = type, default, make }
