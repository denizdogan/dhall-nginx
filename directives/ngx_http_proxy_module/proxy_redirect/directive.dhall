let d = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let type = < default | off | redirect : { from : Text, to : Text } >

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text =
              merge
                { off = "off"
                , default = "off"
                , redirect =
                    λ(r : { from : Text, to : Text }) → "${r.from} ${r.to}"
                }
                value

        in  indent n "proxy_redirect ${text};"

in  d.makeDirective type make
