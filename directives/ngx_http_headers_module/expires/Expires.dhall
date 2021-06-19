let Interval = ../../../types/Interval/type.dhall

in  < epoch
    | max
    | off
    | addTime : Interval
    | subtractTime : Interval
    | timeOfDay : Interval
    | text : Text
    >
