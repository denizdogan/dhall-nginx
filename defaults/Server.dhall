let SSL = ../schemas/SSL.dhall

in  { includes = [] : List Text
    , log = { access = False, error = False }
    , ssl = SSL.default
    }
