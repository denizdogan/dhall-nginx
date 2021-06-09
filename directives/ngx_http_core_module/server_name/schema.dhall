let d = ../../../utils/directives.dhall

in  d.textSep " " "server_name" /\ { default = [] : List Text }
