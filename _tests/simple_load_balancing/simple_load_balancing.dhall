let ng = ../../package.dhall

let upstream =
      ng.upstream::{
      , name = "myproject"
      , server =
        [ ng.upstream.server::{ address = "127.0.0.1:8000", weight = Some 3 }
        , ng.upstream.server::{ address = "127.0.0.1:8001" }
        , ng.upstream.server::{ address = "127.0.0.1:8002" }
        , ng.upstream.server::{ address = "127.0.0.1:8003" }
        ]
      }

let server =
      ng.server::{
      , listen = [ ng.listen.port 80 ]
      , location =
        [ ng.location::{ proxy_pass = Some "http://myproject", uri = "/" } ]
      , server_name = [ "www.domain.com" ]
      }

let http = ng.http::{ server = [ server ], upstream = [ upstream ] }

in  ng.http.make 0 http
