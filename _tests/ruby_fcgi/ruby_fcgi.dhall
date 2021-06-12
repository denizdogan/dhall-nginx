let ng = ../../package.dhall

let config =
      ng.config::{
      , events = ng.events::{ worker_connections = Some 1024 }
      , http = Some ng.http::{
        , types = Some ng.helpers.mime_types
        , default_type = Some "application/octet-stream"
        , sendfile = Some True
        , tcp_nopush = Some True
        , keepalive_timeout = Some ng.keepalive_timeout::{
          , timeout = ng.Interval::{ seconds = Some 65 }
          }
        , gzip = Some True
        , gzip_types =
          [ "text/plain"
          , "text/css"
          , "text/javascript"
          , "application/javascript"
          , "application/json"
          , "application/xml"
          ]
        , index = Some [ "index.html", "index.htm" ]
        , server =
          [ ng.server::{
            , server_name = [ ".example.com" ]
            , listen = [ ng.listen::{ address = "80" } ]
            , root = Some "/srv/http/my_app/public"
            , location =
              [ ng.location::{
                , uri = "/"
                , proxy_pass = Some "http://unix:/var/run/my_app.sock:"
                , proxy_redirect = Some ng.proxy_redirect.Type.off
                , proxy_set_header = toMap
                    { X-Real-IP = "\$remote_addr"
                    , X-Forwarded-For = "\$proxy_add_x_forwarded_for"
                    , Host = "\$http_host"
                    }
                }
              ]
            }
          ]
        }
      , user = Some ng.user::{ user = "http" }
      , worker_processes = Some (ng.worker_processes.Type.number 3)
      }

in  ng.config.make 0 config
