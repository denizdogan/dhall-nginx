let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        indent n ("index " ++ Text/concatSep " " c ++ ";")

in  { Type = type, default, make }
