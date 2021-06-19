let size = ../utils/size.dhall

let Size = size.Size

in  < off | shared : { name : Text, size : Size } >
