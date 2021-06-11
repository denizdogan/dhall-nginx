let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let directives = ../../../utils/directives.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text =
              merge
                { number = λ(n : Natural) → Natural/show n, auto = "auto" }
                value

        in  indent n "worker_processes ${text};"

in  directives.makeDirective type make ⫽ { default }
