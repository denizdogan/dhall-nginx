let d = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text =
              merge
                { on = "on"
                , off = "off"
                , threads =
                    λ(t : Optional Text) →
                      merge
                        { None = "threads"
                        , Some = λ(s : Text) → "threads=${s}"
                        }
                        t
                }
                value

        in  indent n "aio ${text};"

in  d.makeDirective type make
