let type = ./type.dhall

let show =
      λ(size : type) →
        merge
          { bytes = λ(n : Natural) → "${Natural/show n}"
          , kilobytes = λ(n : Natural) → "${Natural/show n}k"
          , megabytes = λ(n : Natural) → "${Natural/show n}m"
          , gigabytes = λ(n : Natural) → "${Natural/show n}g"
          }
          size

in  show
