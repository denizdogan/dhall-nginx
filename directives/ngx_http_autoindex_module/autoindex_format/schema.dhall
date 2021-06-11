let type = ./type.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text =
              merge
                { html = "html", xml = "xml", json = "json", jsonp = "jsonp" }
                value

        in  indent n "autoindex_format ${text};"

in    directives.makeDirective type make
    ⫽ { html = type.html, xml = type.xml, json = type.json, jsonp = type.jsonp }
