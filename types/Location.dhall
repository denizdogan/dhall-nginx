{ proxy_pass : ./ProxyPass.dhall
, path :
    { RegularExpression_CaseInsensitive : Optional Text
    , RegularExpression_CaseSensitive : Optional Text
    , Equality : Optional Text
    , _None : Optional Text
    , BestNonRegularExpression : Optional Text
    }
, headers : List ./Header.dhall
, proxy_headers : List ./Header.dhall
, index : Optional Text
, alias : Optional Text
, return :
    Optional { code : Optional Natural, arguments : Optional (List Text) }
, rewrite :
    Optional
      { regex : Text, replacement : Text, flag : Optional Text, log : Bool }
}
