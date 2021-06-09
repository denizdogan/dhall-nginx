let d = ../../../utils/directives.dhall

in  d.textSep " " "index" /\ { default = [] : List Text }
