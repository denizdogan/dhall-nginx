let Prelude = ../../../Prelude.dhall

let Map = Prelude.Map.Type

in  { default : Optional Text
    , entries : Map Text Text
    , hostnames : Bool
    , name : Text
    , variable : Text
    , volatile : Bool
    }
