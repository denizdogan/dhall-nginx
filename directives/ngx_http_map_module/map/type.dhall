let Map = https://prelude.dhall-lang.org/Map/Type.dhall

in  { default : Optional Text
    , entries : Map Text Text
    , hostnames : Bool
    , name : Text
    , variable : Text
    , volatile : Bool
    }
