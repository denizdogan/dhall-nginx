let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let text =
              merge { off = "off", exact = "exact", before = "before" } value

        in  indent n "if_modified_since ${text};"

in  { Type = type
    , default
    , make
    , before = type.before
    , exact = type.exact
    , off = type.off
    }
