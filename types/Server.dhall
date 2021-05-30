{ name : Text
, listen : ./Listen.dhall
, includes : List Text
, locations : List ./Location.dhall
, log : { access : Bool, error : Bool }
, ssl : ./SSL.dhall
}
