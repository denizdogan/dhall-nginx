let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let Optional/default = https://prelude.dhall-lang.org/Optional/default.dhall

let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let default_type = ../default_type/schema.dhall

let log_subrequest = ../log_subrequest/schema.dhall

let max_ranges = ../max_ranges/schema.dhall

let msie_padding = ../msie_padding/schema.dhall

let modifier = ./modifier.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let default_type =
              Optional/map Text Text (default_type.make (n + 2)) c.default_type

        let log_subrequest =
              Optional/map
                Bool
                Text
                (log_subrequest.make (n + 2))
                c.log_subrequest

        let max_ranges =
              Optional/map Natural Text (max_ranges.make (n + 2)) c.max_ranges

        let msie_padding =
              Optional/map Bool Text (msie_padding.make (n + 2)) c.msie_padding

        let directives =
              List/unpackOptionals
                Text
                [ default_type, log_subrequest, max_ranges, msie_padding ]

        let nameOrUri =
              merge
                { Some = λ(n : Text) → "@" ++ n
                , None =
                    let modif =
                          merge
                            { exact = "= "
                            , regexCaseSensitive = "~ "
                            , regexCaseInsensitive = "~* "
                            , regexPrefix = "^~ "
                            , prefix = ""
                            }
                            c.modifier

                    in  "${modif}${Optional/default Text "" c.uri}"
                }
                c.name

        in  Text/concatSep
              "\n"
              [ indent n "location ${nameOrUri} {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  { Type = type, default, make, modifier }
