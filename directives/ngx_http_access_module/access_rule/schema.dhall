let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let text =
              merge
                { None =
                    merge
                      { None = "error", Some = λ(d : Text) → "deny ${d}" }
                      c.deny
                , Some = λ(a : Text) → "allow ${a}"
                }
                c.allow

        in  indent n "${text};"

in  { Type = type, default, make }
