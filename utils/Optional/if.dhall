let Optional/if =
      λ(t : Type) →
      λ(bool : Bool) →
      λ(value : t) →
        if bool then Some value else None t

let example0 = assert : Optional/if Natural False 1 ≡ None Natural

let example1 = assert : Optional/if Natural True 1 ≡ Some 1

in  Optional/if
