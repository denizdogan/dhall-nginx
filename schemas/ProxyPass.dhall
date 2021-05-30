let Upstream = ../types/Upstream.dhall

let type = ../types/ProxyPass.dhall

let default = ../defaults/ProxyPass.dhall

in  { Type = type
    , default
    , make =
        λ(proxyPass : type) →
          merge
            { Address =
                λ(t : { address : Text, port : Natural }) →
                  "proxy_pass ${t.address}:${Natural/show t.port};"
            , Upstream =
                λ(t : { upstream : Upstream, scheme : Text }) →
                  "proxy_pass ${t.scheme}${t.upstream.name};"
            , _None = λ(t : Bool) → ""
            }
            proxyPass
    }
