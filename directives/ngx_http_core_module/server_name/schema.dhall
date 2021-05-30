let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let server_names = Text/concatSep " " value

        in  indent n "server_name ${server_names};"

in  { Type = type, default, make }
