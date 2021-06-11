let LogLevel = ../../../types/LogLevel.dhall

let directives = ../../../utils/directives.dhall

let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let level =
              merge
                { Some =
                    λ(l : LogLevel) →
                      merge
                        { debug = " debug"
                        , info = " info"
                        , notice = " notice"
                        , warn = " warn"
                        , error = " error"
                        , crit = " crit"
                        , alert = " alert"
                        , emerg = " emerg"
                        }
                        l
                , None = ""
                }
                value.level

        in  indent n "error_log ${value.file}${level};"

in  directives.makeDirective type make ⫽ { default }
