let or = ./or.dhall

let r = { r = True, w = False, x = False }

let w = { r = False, w = True, x = False }

let x = { r = False, w = False, x = True }

let none = { r = False, w = False, x = False }

let all = or r (or w (or x none))

let rw = or r (or w none)

let rx = or r (or x none)

in  { r, w, x, rw, rx, none, all }
