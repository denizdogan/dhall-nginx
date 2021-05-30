let Optional/showText = ../util/Optional/showText.dhall

let Optional/show = ../util/Optional/show.dhall

let type = ../types/Listen.dhall

let default = ../defaults/Listen.dhall

in  { Type = type
    , default
    , make =
        λ(listen : type) →
              "listen "
          ++  Optional/showText listen.address
          ++  Optional/show
                Natural
                (λ(t : Natural) → ":" ++ Natural/show t)
                listen.port
          ++  ";"
    }
