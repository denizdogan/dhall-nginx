let type = ./ServerTokens.dhall

let make =
      \(n : Natural) ->
      \(c : type) ->
        let text =
              merge
                { on = "on"
                , off = "off"
                , build = "build"
                , string = \(s : Text) -> s
                }
                c

        in  "server_tokens ${text};"

let d = ../../../utils/directives.dhall

in  d.makeDirective type make
