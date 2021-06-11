let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let type = ./type.dhall

let default = ./default.dhall

let RewriteFlag = ./RewriteFlag.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let regex = c.regex

        let replacement = c.replacement

        let flag =
              merge
                { None = ""
                , Some =
                    λ(f : RewriteFlag) →
                      merge
                        { break = " break"
                        , last = " last"
                        , redirect = " redirect"
                        , permanent = " permanent"
                        }
                        f
                }
                c.flag

        in  indent n "rewrite ${regex} ${replacement}${flag};"

in  directives.makeDirective type make ⫽ { default }
