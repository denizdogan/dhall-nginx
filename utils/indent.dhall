let Prelude = ../Prelude.dhall

let Text/spaces = Prelude.Text.spaces

let indent = λ(n : Natural) → λ(t : Text) → Text/spaces n ++ t

in  indent
