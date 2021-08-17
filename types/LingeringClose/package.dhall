let type = ./type.dhall

in  { show = ./show.dhall
    , type
    , on = type.on
    , off = type.off
    , always = type.always
    }
