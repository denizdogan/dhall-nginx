let type = ./type.dhall

let show =
      λ(value : type) →
        merge
          { debug = "debug"
          , info = "info"
          , notice = "notice"
          , warn = "warn"
          , error = "error"
          , crit = "crit"
          , alert = "alert"
          , emerg = "emerg"
          }
          value

in  show
