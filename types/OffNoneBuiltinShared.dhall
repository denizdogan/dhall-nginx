let size = ../utils/size.dhall

let Size = size.Size

in  < off | none | builtin : Size | shared : { name : Text, size : Size } >
