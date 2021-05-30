let Map/empty = https://prelude.dhall-lang.org/Map/empty.dhall

in  { default = None Text
    , entries = Map/empty Text Text
    , hostnames = False
    , volatile = False
    }
