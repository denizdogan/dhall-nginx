let Text/concat = https://prelude.dhall-lang.org/Text/concat.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let Optional/null = https://prelude.dhall-lang.org/Optional/null.dhall

let Optional/fold = https://prelude.dhall-lang.org/Optional/fold.dhall

let ProxyPass = ./ProxyPass.dhall

let Header = ./Header.dhall

let makeMatch =
      λ ( matchType
        : { RegularExpression_CaseInsensitive : Optional Text
          , RegularExpression_CaseSensitive : Optional Text
          , Equality : Optional Text
          , _None : Optional Text
          , BestNonRegularExpression : Optional Text
          }
        ) →
        if    Optional/null Text matchType.RegularExpression_CaseInsensitive
        then  "= ${Optional/fold
                     Text
                     matchType.RegularExpression_CaseSensitive
                     Text
                     (λ(t : Text) → t)
                     ""}"
        else  "~* ${Optional/fold
                      Text
                      matchType.RegularExpression_CaseInsensitive
                      Text
                      (λ(t : Text) → t)
                      ""}"

let Rewrite =
      { regex : Text, replacement : Text, flag : Optional Text, log : Bool }

let makeRewrite =
      λ ( rewrite
        : Optional
            { regex : Text
            , replacement : Text
            , flag : Optional Text
            , log : Bool
            }
        ) →
        let from =
              Optional/fold Rewrite rewrite Text (λ(t : Rewrite) → t.regex) ""

        let to =
              Optional/fold
                Rewrite
                rewrite
                Text
                (λ(t : Rewrite) → t.replacement)
                ""

        in  "rewrite ${from} ${to};"

let type = ../types/Location.dhall

let default = ../defaults/Location.dhall

in  { Type = type
    , default
    , make =
        λ(location : type) →
          let match = makeMatch location.path

          let rewrite = makeRewrite location.rewrite

          let headers =
                Text/concat
                  (List/map Header.Type Text Header.make location.headers)

          let proxy_headers =
                Text/concat
                  ( List/map
                      Header.Type
                      Text
                      Header.makeProxy
                      location.proxy_headers
                  )

          let proxy_pass = ProxyPass.make location.proxy_pass

          in  ''
              location ${match} {
                      ${rewrite}
                      ${headers}
                      ${proxy_headers}
                      ${proxy_pass}
                  }''
    }
