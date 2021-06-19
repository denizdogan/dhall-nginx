let type = ./type.dhall

let and =
      \(a : type) ->
      \(b : type) ->
        { r = a.r && b.r, w = a.w && a.w, x = a.x && b.x }

in  and
