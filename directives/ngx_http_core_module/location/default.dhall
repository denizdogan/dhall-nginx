let modifier = ./modifier.dhall

in  { default_type = None ../default_type/type.dhall
    , log_subrequest = None ../log_subrequest/type.dhall
    , max_ranges = None ../max_ranges/type.dhall
    , modifier = modifier.prefix
    , msie_padding = None ../msie_padding/type.dhall
    , name = None Text
    , uri = None Text
    }
