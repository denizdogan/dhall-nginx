let interval = ../../../utils/interval.dhall

in  < epoch
    | max
    | off
    | addTime : interval.Interval.Type
    | subtractTime : interval.Interval.Type
    | timeOfDay : interval.Interval.Type
    | text : Text
    >
