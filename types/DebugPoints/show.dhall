let type = ./type.dhall

let show = λ(value : type) → merge { abort = "abort", stop = "stop" } value

in  show
