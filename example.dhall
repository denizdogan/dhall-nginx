let Ng = ./package.dhall

let config =
      Ng.Configuration::{
      , includeHttp = True
      , upstreams =
        [ Ng.Upstream::{
          , name = "example"
          , servers = [ { address = "example.com", port = 3000 } ]
          }
        ]
      , servers =
        [ Ng.Server::{
          , name = "example.com"
          , listen = Ng.Listen::{ address = Some "localhost", port = Some 3000 }
          , locations =
            [ Ng.Location::{
              , proxy_pass =
                  Ng.ProxyPass.Type.Address
                    { address = "localhost", port = 3000 }
              , path =
                { RegularExpression_CaseInsensitive = Some "^/admin"
                , RegularExpression_CaseSensitive = None Text
                , Equality = None Text
                , _None = None Text
                , BestNonRegularExpression = None Text
                }
              , headers =
                [ { name = "X-Custom", value = "Custom", always = False } ]
              , proxy_headers =
                [ { name = "X-Forward-Proto", value = "https", always = False }
                ]
              , rewrite = Some
                { regex = "regex"
                , replacement = "replacement"
                , flag = Some "flag"
                , log = False
                }
              }
            ]
          }
        ]
      }

in  Ng.Configuration.make config
