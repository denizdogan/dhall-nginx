let Size = ../../../types/Size/type.dhall

let Interval = ../../../types/Interval/type.dhall

in  { path : Text
    , levels : List Natural
    , use_temp_path : Optional Bool
    , keys_zone : { name : Text, size : Size }
    , inactive : Optional Interval
    , max_size : Optional Size
    , min_free : Optional Size
    , manager_files : Optional Natural
    , manager_sleep : Optional Interval
    , manager_threshold : Optional Interval
    , loader_files : Optional Natural
    , loader_sleep : Optional Natural
    , loader_threshold : Optional Interval
    , purger : Optional Bool
    , purger_files : Optional Natural
    , purger_sleep : Optional Interval
    , purger_threshold : Optional Interval
    }
