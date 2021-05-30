let ProxyPass = ../types/ProxyPass.dhall

in  { proxy_pass = ProxyPass._None False
    , path =
      { RegularExpression_CaseInsensitive = None Text
      , RegularExpression_CaseSensitive = None Text
      , Equality = None Text
      , _None = None Text
      , BestNonRegularExpression = None Text
      }
    , headers = [] : List ../types/Header.dhall
    , proxy_headers = [] : List ../types/Header.dhall
    , return =
        None { code : Optional Natural, arguments : Optional (List Text) }
    , rewrite =
        None
          { regex : Text, replacement : Text, flag : Optional Text, log : Bool }
    , index = None Text
    , alias = None Text
    }
