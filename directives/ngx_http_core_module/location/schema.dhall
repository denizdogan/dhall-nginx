let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let Optional/default = https://prelude.dhall-lang.org/Optional/default.dhall

let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let default_type = ../default_type/schema.dhall

let index = ../../ngx_http_index_module/index/schema.dhall

let log_not_found = ../log_not_found/schema.dhall

let log_subrequest = ../log_subrequest/schema.dhall

let max_ranges = ../max_ranges/schema.dhall

let msie_padding = ../msie_padding/schema.dhall

let try_files = ../try_files/schema.dhall

let modifier = ./modifier.dhall

let fastcgi_param = ../../ngx_http_fastcgi_module/fastcgi_param/schema.dhall

let fastcgi_pass = ../../ngx_http_fastcgi_module/fastcgi_pass/schema.dhall

let fastcgi_intercept_errors =
      ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/schema.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let default_type =
              Optional/map Text Text (default_type.make (n + 2)) c.default_type

        let fastcgi_params =
              List/map
                fastcgi_param.Type
                Text
                (fastcgi_param.make (n + 2))
                c.fastcgi_param

        let index = Optional/map index.Type Text (index.make (n + 2)) c.index

        let log_not_found =
              Optional/map
                log_not_found.Type
                Text
                (log_not_found.make (n + 2))
                c.log_not_found

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

        let fastcgi_pass =
              Optional/map Text Text (fastcgi_pass.make (n + 2)) c.fastcgi_pass

        let try_files =
              Optional/map
                try_files.Type
                Text
                (try_files.make (n + 2))
                c.try_files

        let fastcgi_intercept_errors =
              Optional/map
                Bool
                Text
                (fastcgi_intercept_errors.make (n + 2))
                c.fastcgi_intercept_errors

        let directives =
                List/unpackOptionals
                  Text
                  [ default_type, fastcgi_intercept_errors ]
              # fastcgi_params
              # List/unpackOptionals
                  Text
                  [ fastcgi_pass
                  , index
                  , log_not_found
                  , log_subrequest
                  , max_ranges
                  , msie_padding
                  , try_files
                  ]

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
