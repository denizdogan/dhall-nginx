let ng = ../../package.dhall

let mainLog =
      ng.log_format::{
      , name = "main"
      , format =
          "\$remote_addr - \$remote_user [\$time_local] \$status \"\$request\" \$body_bytes_sent \"\$http_referer\" \"\$http_user_agent\" \"\$http_x_forwarded_for\""
      }

let upstream =
      ng.upstream::{
      , name = "big_server_com"
      , server =
        [ ng.upstream.server::{ address = "127.0.0.3:8000", weight = Some 5 }
        , ng.upstream.server::{ address = "127.0.0.3:8001", weight = Some 5 }
        , ng.upstream.server::{ address = "192.168.0.1:8000" }
        , ng.upstream.server::{ address = "192.168.0.1:8001" }
        ]
      }

let server_domain1 =
      ng.server::{
      , access_log = Some ng.access_log::{
        , path = Some "logs/domain1.access.log"
        , format = Some mainLog
        }
      , listen = [ ng.listen::{ address = "80" } ]
      , location =
        [ ng.location::{
          , fastcgi_pass = Some "127.0.0.1:1025"
          , modifier = ng.location.modifier.regexCaseSensitive
          , uri = "\\.php\$"
          }
        ]
      , root = Some "html"
      , server_name = [ "domain1.com", "www.domain1.com" ]
      }

let server_domain2 =
      ng.server::{
      , access_log = Some ng.access_log::{
        , path = Some "logs/domain2.access.log"
        , format = Some mainLog
        }
      , listen = [ ng.listen::{ address = "80" } ]
      , location =
        [ ng.location::{
          , expires = Some ng.expires::{
            , time = ng.expires.Expires.addTime ng.Interval::{ days = Some 30 }
            }
          , proxy_temp_path = Some ng.proxy_temp_path::{
            , path = "/tmp/var/proxy"
            , levels = [ 1, 2 ]
            }
          , root = Some "/var/www/virtual/big.server.com/htdocs"
          , modifier = ng.location.modifier.regexCaseSensitive
          , uri = "^/(images|javascript|js|css|flash|media|static)/"
          }
        , ng.location::{ uri = "/", proxy_pass = Some "http://127.0.0.1:8080" }
        ]
      , server_name = [ "domain2.com", "www.domain2.com" ]
      }

let server_big =
      ng.server::{
      , access_log = Some ng.access_log::{
        , path = Some "logs/big.server.access.log"
        , format = Some mainLog
        }
      , listen = [ ng.listen::{ address = "80" } ]
      , location =
        [ ng.location::{ uri = "/", proxy_pass = Some "http://big_server_com" }
        ]
      , server_name = [ "big.server.com" ]
      }

let http =
      Some
        ng.http::{
        , access_log = Some ng.access_log::{
          , path = Some "logs/access.log"
          , format = Some mainLog
          }
        , client_body_buffer_size = Some (ng.Size.kilobytes 128)
        , client_max_body_size = Some (ng.Size.megabytes 10)
        , default_type = Some "application/octet-stream"
        , fastcgi_index = Some "index.php"
        , fastcgi_param = ng.helpers.fastcgi_params
        , index = Some [ "index.html", "index.htm", "index.php" ]
        , log_format = [ mainLog ]
        , proxy_buffers = Some ng.proxy_buffers::{
          , number = 32
          , size = ng.Size.kilobytes 4
          }
        , proxy_connect_timeout = Some ng.Interval::{ seconds = Some 90 }
        , proxy_read_timeout = Some ng.Interval::{ seconds = Some 90 }
        , proxy_redirect = Some ng.proxy_redirect.Type.off
        , proxy_send_timeout = Some ng.Interval::{ seconds = Some 90 }
        , proxy_set_header = toMap
            { Host = "\$host"
            , X-Forwarded-For = "\$proxy_add_x_forwarded_for"
            , X-Real-IP = "\$remote_addr"
            }
        , proxy_temp_path = Some ng.proxy_temp_path::{ path = "/tmp/var/proxy" }
        , sendfile = Some True
        , server = [ server_domain1, server_domain2, server_big ]
        , server_names_hash_bucket_size = Some 128
        , tcp_nopush = Some True
        , types = Some ng.helpers.mime_types
        , upstream = [ upstream ]
        }

let config =
      ng.config::{
      , error_log = Some ng.error_log::{ file = "logs/error.log" }
      , events = ng.events::{ worker_connections = Some 4096 }
      , http
      , pid = Some "logs/nginx.pid"
      , user = Some ng.user::{ user = "www", group = Some "www" }
      , worker_processes = Some (ng.worker_processes.Type.number 5)
      , worker_rlimit_nofile = Some 8192
      }

in  ng.config.make 0 config
