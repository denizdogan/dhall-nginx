let Map/empty =
      https://prelude.dhall-lang.org/Map/empty.dhall
        sha256:4c612558b8bbe8f955550ed3fb295d57b1b864c85cd52615b52d0ee0e9682e52

in  { default = None Text
    , entries = Map/empty Text Text
    , hostnames = False
    , volatile = False
    }
