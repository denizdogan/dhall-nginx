let type = ./type.dhall

let show =
      λ(s : type) →
        merge
          { SSLv2 = "SSLv2"
          , SSLv3 = "SSLv3"
          , TLSv1 = "TLSv1"
          , TLSv11 = "TLSv11"
          , TLSv12 = "TLSv12"
          , TLSv13 = "TLSv13"
          }
          s

in  show
