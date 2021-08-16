let Prelude = ../../../Prelude.dhall

let Text/concatSep = Prelude.Text.concatSep

let type = ./type.dhall

let default = ./default.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let files = Text/concatSep " " value.files

        let uri = value.uri

        in  indent n "try_files ${files} ${uri};"

in  directives.makeDirective type make ⫽ { default }
