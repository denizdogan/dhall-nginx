let type = ./type.dhall

let Size/show = ../Size/show.dhall

let show = λ(v : type) → merge { off = "off", size = Size/show } v

in  show
