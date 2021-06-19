let Size = ../Size/type.dhall

in  < off | none | builtin : Size | shared : { name : Text, size : Size } >
