let interval = ../../../utils/interval.dhall

in  { timeout : interval.Interval.Type
    , header_timeout : Optional interval.Interval.Type
    }
