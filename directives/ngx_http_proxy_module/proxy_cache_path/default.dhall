let Size = ../../../types/Size/type.dhall

let Interval = ../../../types/Interval/type.dhall

in  { levels = [] : List Natural
    , use_temp_path = None Bool
    , inactive = None Interval
    , max_size = None Size
    , min_free = None Size
    , manager_files = None Natural
    , manager_sleep = None Interval
    , manager_threshold = None Interval
    , loader_files = None Natural
    , loader_sleep = None Natural
    , loader_threshold = None Interval
    , purger = None Bool
    , purger_files = None Natural
    , purger_sleep = None Interval
    , purger_threshold = None Interval
    }
