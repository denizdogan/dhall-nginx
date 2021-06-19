let type = ./type.dhall

in  { show = ./show.dhall
    , type
    , default = type.default
    , json = type.json
    , none = type.none
    }
