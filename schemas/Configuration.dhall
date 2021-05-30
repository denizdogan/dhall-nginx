let Text/concat = https://prelude.dhall-lang.org/Text/concat.dhall

let List/map = https://prelude.dhall-lang.org/List/map.dhall

let Text/spaces = https://prelude.dhall-lang.org/Text/spaces.dhall

let Upstream = ./Upstream.dhall

let Server = ./Server.dhall

let type = ../types/Configuration.dhall

let default = ../defaults/Configuration.dhall

in  { Type = type
    , default
    , make =
        λ(c : type) →
          let indent = if c.includeHttp then Text/spaces 4 else ""

          let upstreams =
                Text/concat
                  (List/map Upstream.Type Text Upstream.make c.upstreams)

          let servers =
                Text/concat (List/map Server.Type Text Server.make c.servers)

          in  ''
              ${if c.includeHttp then "http {" else ""}
              ${indent}${upstreams}
              ${indent}${servers}
              ${if c.includeHttp then "}" else ""}
              ''
    }
