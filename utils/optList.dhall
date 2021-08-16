let Prelude = ../Prelude.dhall

let Text/concatSep = Prelude.Text.concatSep

let List/map = Prelude.List.map

let optList =
      λ(t : Type) →
      λ(maker : t → Text) →
      λ(values : List t) →
        if    Natural/isZero (List/length t values)
        then  None Text
        else  Some (Text/concatSep "\n" (List/map t Text maker values))

in  optList
