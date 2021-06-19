let type = ./type.dhall

in  { show = ./show.dhall
    , type
    , bytes = type.bytes
    , kilobytes = type.kilobytes
    , megabytes = type.megabytes
    , gigabytes = type.gigabytes
    }
