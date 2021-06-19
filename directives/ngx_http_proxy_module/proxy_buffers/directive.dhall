let d = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let Size/show = ../../../types/Size/show.dhall

let default = ./default.dhall

let type = ./type.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let number = Natural/show value.number

        let size = Size/show value.size

        in  indent n "proxy_buffers ${number} ${size};"

in  d.makeDirective type make ⫽ { default }
