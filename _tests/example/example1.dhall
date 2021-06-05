let ng = ../../package.dhall

let myLogger =
      ng.log_format::{
      , name = "mylogger"
      , escape = Some ng.Escape.none
      , format = "\$remote_addr - \$remote_user [\$time_local]"
      }

let jsonLogger =
      ng.log_format::{
      , name = "jsonlogger"
      , escape = Some ng.Escape.json
      , format = "{\"remote_addr\":\$remote_addr}"
      }

let mapLoggable =
      ng.map::{
      , variable = "http_host"
      , name = "loggable"
      , hostnames = True
      , entries =
        [ { mapKey = "foobar", mapValue = "barbaz" }
        , { mapKey = "barbaz", mapValue = "3" }
        ]
      }

let config =
      ng.config::{
      , user = Some ng.user::{ user = "foo" }
      , worker_processes = Some (ng.worker_processes.Type.number 4)
      , worker_cpu_affinity = Some ng.worker_cpu_affinity::{
        , auto = Some True
        , mask = Some "0110"
        }
      , events = Some ng.events::{
        , accept_mutex = Some True
        , multi_accept = Some True
        , worker_connections = Some 1024
        }
      , http = Some ng.http::{
        , fastcgi_intercept_errors = Some False
        , if_modified_since = Some ng.if_modified_since.exact
        , index = Some ng.index::{ files = [ "index.html", "index.php" ] }
        , log_format = [ myLogger, jsonLogger ]
        , log_not_found = Some False
        , map = [ mapLoggable ]
        , sendfile = Some True
        , server =
          [ ng.server::{
            , access_log = Some ng.access_log::{
              , buffer = Some (ng.Size.kilobytes 1024)
              , flush = Some ng.Interval::{ hours = Some 3 }
              , format = Some jsonLogger
              , gzip = Some True
              , gzipLevel = Some 9
              , `if` = Some "\$loggable"
              , path = Some "/tmp/bar.log"
              }
            , default_type = Some "foobar"
            , fastcgi_intercept_errors = Some True
            , index = Some ng.index::{ files = [ "other.htm" ] }
            , location =
              [ ng.location::{
                , default_type = Some "text/html"
                , fastcgi_param =
                  [ ng.fastcgi_param::{
                    , parameter = "SCRIPT_FILENAME"
                    , value = "\$document_root\$fastcgi_script_name"
                    }
                  ]
                , fastcgi_pass = Some "unix:/tmp/fastcgi.socket"
                , index = Some ng.index::{ files = [ "foobar.html" ] }
                , log_not_found = Some True
                , log_subrequest = Some True
                , max_ranges = Some 512
                , modifier = ng.location.modifier.exact
                , uri = Some "/"
                }
              , ng.location::{
                , default_type = Some "foo"
                , fastcgi_intercept_errors = Some True
                , log_subrequest = Some True
                , max_ranges = Some 512
                , msie_padding = Some False
                , modifier = ng.location.modifier.regexCaseInsensitive
                , uri = Some "^/users/(.+\\.(?:gif|jpe?g|png))\$"
                }
              , ng.location::{
                , default_type = Some "bar"
                , log_subrequest = Some False
                , max_ranges = None Natural
                , msie_padding = Some True
                , name = Some "bar"
                }
              ]
            , log_not_found = Some False
            , root = Some "/var/root"
            , server_name = [ "hello.net", "there.com" ]
            , tcp_nodelay = Some True
            }
          ]
        , types = Some (toMap { fruits = [ "apple", "banana" ] })
        , default_type = Some "text/html"
        , upstream =
          [ ng.upstream::{
            , name = "django"
            , server =
              [ ng.upstream.server::{
                , address = "localhost"
                , fail_timeout = Some ng.Interval::{ minutes = Some 4 }
                }
              ]
            }
          ]
        }
      , pcre_jit = Some True
      , pid = Some "pidfile"
      , error_log = Some ng.error_log::{
        , file = "/tmp/error.log"
        , level = Some ng.LogLevel.warn
        }
      }

in  ng.config.make 0 config
