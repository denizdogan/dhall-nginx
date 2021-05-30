let interval = ../../../utils/interval.dhall

in  { address : Text
    , backup : Bool
    , down : Bool
    , drain : Bool
    , fail_timeout : Optional interval.Interval.Type
    , max_fails : Optional Natural
    , resolve : Bool
    , route : Optional Text
    , service : Optional Text
    , slow_start : Optional interval.Interval.Type
    , weight : Optional Natural
    }
