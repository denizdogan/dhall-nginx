let Text/spaces = https://prelude.dhall-lang.org/Text/spaces.dhall

let indent = λ(n : Natural) → λ(t : Text) → Text/spaces n ++ t

in  indent
