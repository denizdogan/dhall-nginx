let Map =
      https://prelude.dhall-lang.org/Map/Type.dhall sha256:210c7a9eba71efbb0f7a66b3dcf8b9d3976ffc2bc0e907aadfb6aa29c333e8ed

in  { default : Optional Text
    , entries : Map Text Text
    , hostnames : Bool
    , name : Text
    , variable : Text
    , volatile : Bool
    }
