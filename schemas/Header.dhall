let type = ../types/Header.dhall

let default = ../defaults/Header.dhall

let alwaysText = λ(always : Bool) → if always then " always" else ""

in  { Type = type
    , default
    , make =
        λ(header : type) →
          "add_header ${header.name} ${header.value}${alwaysText
                                                        header.always};"
    , makeProxy =
        λ(header : type) → "proxy_set_header ${header.name} ${header.value};"
    }
