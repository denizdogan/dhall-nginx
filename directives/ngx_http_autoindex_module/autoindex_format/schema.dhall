let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text =
              merge
                { html = "html", xml = "xml", json = "json", jsonp = "jsonp" }
                value

        in  indent n "autoindex_format ${text};"

in  { Type = type
    , default
    , make
    , html = type.html
    , xml = type.xml
    , json = type.json
    , jsonp = type.jsonp
    }
