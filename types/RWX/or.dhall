let type = ./type.dhall

let or =
      \(a : type) ->
      \(b : type) ->
        { r = a.r || b.r, w = a.w || b.w, x = a.x || b.x }

in  or
