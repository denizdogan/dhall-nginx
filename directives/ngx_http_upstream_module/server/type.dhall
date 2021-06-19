let Interval = ../../../types/Interval/type.dhall

in  { address : Text
    , backup : Bool
    , down : Bool
    , drain : Bool
    , fail_timeout : Optional Interval
    , max_fails : Optional Natural
    , resolve : Bool
    , route : Optional Text
    , service : Optional Text
    , slow_start : Optional Interval
    , weight : Optional Natural
    }
