let Size =
      < bytes : Natural
      | kilobytes : Natural
      | megabytes : Natural
      | gigabytes : Natural
      >

let Size/show =
      λ(size : Size) →
        merge
          { bytes = λ(n : Natural) → "${Natural/show n}"
          , kilobytes = λ(n : Natural) → "${Natural/show n}k"
          , megabytes = λ(n : Natural) → "${Natural/show n}m"
          , gigabytes = λ(n : Natural) → "${Natural/show n}g"
          }
          size

let example1 = assert : Size/show (Size.bytes 1) ≡ "1"

let example2 = assert : Size/show (Size.kilobytes 1) ≡ "1k"

let example3 = assert : Size/show (Size.megabytes 1) ≡ "1m"

let example4 = assert : Size/show (Size.gigabytes 1) ≡ "1g"

in  { Size, Size/show }
