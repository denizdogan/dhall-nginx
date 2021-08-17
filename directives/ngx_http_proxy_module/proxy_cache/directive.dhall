let d = ../../../utils/directives.dhall

let OffString = ../../../types/OffString/package.dhall

in      d.directive OffString.type OffString.show "proxy_cache"
    //  { off = OffString.type.off, zone = OffString.type.string }
