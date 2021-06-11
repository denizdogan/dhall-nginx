let Function/identity = https://prelude.dhall-lang.org/Function/identity.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let indent = ./indent.dhall

let interval = ./interval.dhall

let size = ./size.dhall

let Size = size.Size

let Size/show = size.Size/show

let SizeOrOff = ../types/SizeOrOff.dhall

let opt =
      λ(t : Type) →
      λ(make : Natural → t → Text) →
      λ(v : Optional t) →
      λ(n : Natural) →
        Optional/map t Text (make n) v

let listOpt =
      λ(t : Type) →
      λ(make : Natural → t → Text) →
      λ(values : List t) →
      λ(n : Natural) →
        if    Natural/isZero (List/length t values)
        then  None Text
        else  Some (Text/concatSep "\n" (List/map t Text (make n) values))

let makeDirective =
      λ(type : Type) →
      λ(make : Natural → type → Text) →
        { Type = type, make, opt = opt type make, listOpt = listOpt type make }

let directive =
      λ(type : Type) →
      λ(f : type → Text) →
      λ(name : Text) →
        let make =
              λ(n : Natural) →
              λ(value : type) →
                let text = f value in indent n "${name} ${text};"

        in  { Type = type
            , make
            , opt = opt type make
            , listOpt = listOpt type make
            }

let interval = directive interval.Interval.Type interval.Interval/show

let natural = directive Natural Natural/show

let on_off = directive Bool (λ(value : Bool) → if value then "on" else "off")

let size = directive Size Size/show

let sizeOrOff =
      directive
        SizeOrOff
        (λ(v : SizeOrOff) → merge { off = "off", size = Size/show } v)

let text = directive Text (Function/identity Text)

let textSep =
      λ(sep : Text) →
        directive (List Text) (λ(ss : List Text) → Text/concatSep sep ss)

in  { interval
    , natural
    , makeDirective
    , listOpt
    , on_off
    , opt
    , size
    , sizeOrOff
    , SizeOrOff
    , text
    , textSep
    }
