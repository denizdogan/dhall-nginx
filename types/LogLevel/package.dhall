let type = ./type.dhall

in  { show = ./show.dhall
    , type
    , debug = type.debug
    , info = type.info
    , notice = type.notice
    , warn = type.warn
    , error = type.error
    , crit = type.crit
    , alert = type.alert
    , emerg = type.emerg
    }
