let interval = ../../../utils/interval.dhall

in  { backup = False
    , down = False
    , drain = False
    , fail_timeout = None interval.Interval.Type
    , max_fails = None Natural
    , resolve = False
    , route = None Text
    , service = None Text
    , slow_start = None interval.Interval.Type
    , weight = None Natural
    }
