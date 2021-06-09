let Function/identity = https://prelude.dhall-lang.org/Function/identity.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let indent = ./indent.dhall

let opt =
      λ(t : Type) →
      λ(make : Natural → t → Text) →
      λ(v : Optional t) →
      λ(n : Natural) →
        Optional/map t Text (make n) v

let directive =
      λ(type : Type) →
      λ(f : type → Text) →
      λ(name : Text) →
        let make =
              λ(n : Natural) →
              λ(value : type) →
                let text = f value in indent n "${name} ${text};"

        in  { Type = type, make, opt = opt type make }

let natural = directive Natural Natural/show

let on_off = directive Bool (λ(value : Bool) → if value then "on" else "off")

let text = directive Text (Function/identity Text)

in  { natural, on_off, text }
