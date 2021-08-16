let Prelude = ../../../Prelude.dhall

let Map/empty = Prelude.Map.empty

in  { default = None Text
    , entries = Map/empty Text Text
    , hostnames = False
    , volatile = False
    }
