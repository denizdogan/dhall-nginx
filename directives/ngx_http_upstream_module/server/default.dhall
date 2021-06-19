let Interval = ../../../types/Interval/type.dhall

in  { backup = False
    , down = False
    , drain = False
    , fail_timeout = None Interval
    , max_fails = None Natural
    , resolve = False
    , route = None Text
    , service = None Text
    , slow_start = None Interval
    , weight = None Natural
    }
