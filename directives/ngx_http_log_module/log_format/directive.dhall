let Text/concatSep =
      https://prelude.dhall-lang.org/Text/concatSep.dhall sha256:e4401d69918c61b92a4c0288f7d60a6560ca99726138ed8ebc58dca2cd205e58

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall sha256:0cbaa920f429cf7fc3907f8a9143203fe948883913560e6e1043223e6b3d05e4

let Escape = < default | json | none >

let type = ./type.dhall

let default = ./default.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let name = Some value.name

        let escape =
              merge
                { None = None Text
                , Some =
                    λ(e : Escape) →
                      merge
                        { default = Some "escape=default"
                        , json = Some "escape=json"
                        , none = Some "escape=none"
                        }
                        e
                }
                value.escape

        let format = Some "'${value.format}'"

        let text =
              Text/concatSep
                " "
                (List/unpackOptionals Text [ name, escape, format ])

        in  indent n "log_format ${text};"

in  directives.makeDirective type make ⫽ { default }
