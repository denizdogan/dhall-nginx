let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let directives = ../../../utils/directives.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let auto =
              merge
                { Some = λ(s : Bool) → if s then " auto" else "", None = "" }
                value.auto

        let mask = merge { Some = λ(s : Text) → " ${s}", None = "" } value.mask

        in  indent n "worker_cpu_affinity${auto}${mask};"

in  directives.makeDirective type make ⫽ { default }
