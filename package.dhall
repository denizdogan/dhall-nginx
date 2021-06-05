let size = ./utils/size.dhall

let interval = ./utils/interval.dhall

let LogLevel = ./types/LogLevel.dhall

let Escape = ./types/Escape.dhall

in      { config = ./main.dhall
        , Interval = interval.Interval
        , Size = size.Size
        , LogLevel
        , Escape
        , helpers = ./utils/helpers/package.dhall
        }
    /\  ./directives/package.dhall
