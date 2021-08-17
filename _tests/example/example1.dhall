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
      , daemon = Some False
      , debug_points = Some ng.DebugPoints.abort
      , lock_file = Some "/tmp/lock.tmp"
      , master_process = Some True
      , ssl_engine = Some "foossl"
      , timer_resolution = Some ng.Interval::{ milliseconds = Some 100 }
      , user = Some ng.user::{ user = "foo" }
      , worker_aio_requests = Some 3
      , worker_priority = Some -10
      , worker_processes = Some (ng.worker_processes.Type.number 4)
      , worker_cpu_affinity = Some ng.worker_cpu_affinity::{
        , auto = Some True
        , mask = Some "0110"
        }
      , worker_shutdown_timeout = Some ng.Interval::{ seconds = Some 10 }
      , events = ng.events::{
        , accept_mutex = Some True
        , accept_mutex_delay = Some ng.Interval::{ milliseconds = Some 500 }
        , debug_connection = Some "unix:"
        , multi_accept = Some True
        , worker_connections = Some 1024
        }
      , http = Some ng.http::{
        , add_header =
          [ ng.add_header::{ name = "X-Foo", value = "Bar", always = True } ]
        , add_trailer = [ ng.add_trailer::{ name = "X-Baz", value = "Qux" } ]
        , fastcgi_intercept_errors = Some False
        , fastcgi_temp_file_write_size = Some (ng.Size.kilobytes 1024)
        , gzip_vary = Some False
        , if_modified_since = Some ng.if_modified_since.exact
        , index = Some [ "index.html", "index.php" ]
        , lingering_close = Some ng.LingeringClose.on
        , limit_rate = Some (ng.Size.kilobytes 100)
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
            , fastcgi_store_access = Some ng.Permission._777
            , gzip_vary = Some True
            , index = Some [ "other.htm" ]
            , limit_rate = Some (ng.Size.kilobytes 16)
            , lingering_close = Some ng.LingeringClose.off
            , listen =
              [ ng.listen.address "localhost"
              , ng.listen.addressPort "foobar.com" 420
              , ng.listen.port 8000
              , ng.listen.unixPath "/tmp/unix.sock"
              , ng.listen.type.Address
                  ng.listen.Address::{
                  , address = "dhall-lang.org"
                  , port = Some 9001
                  , ipv6only = Some True
                  , setfib = Some 1000
                  }
              ]
            , location =
              [ ng.location::{
                , access_rules =
                  [ ng.deny "10.11.12.13"
                  , ng.allow "10.11.12.0/24"
                  , ng.deny "all"
                  ]
                , add_header =
                  [ ng.add_header::{
                    , name = "X-Country"
                    , value = "Sweden"
                    , always = True
                    }
                  ]
                , add_trailer =
                  [ ng.add_trailer::{ name = "X-Continent", value = "Europe" } ]
                , default_type = Some "text/html"
                , fastcgi_param =
                      [ ng.fastcgi_param::{
                        , parameter = "SCRIPT_FILENAME"
                        , value = "\$document_root\$fastcgi_script_name"
                        }
                      ]
                    # ng.helpers.fastcgi_params
                , fastcgi_pass = Some "unix:/tmp/fastcgi.socket"
                , gzip_vary = Some False
                , index = Some [ "foobar.html" ]
                , internal = Some {=}
                , limit_rate = Some (ng.Size.kilobytes 4)
                , lingering_close = Some ng.LingeringClose.always
                , log_not_found = Some True
                , log_subrequest = Some True
                , max_ranges = Some 512
                , modifier = ng.location.modifier.exact
                , try_files = Some ng.try_files::{
                  , files = [ "foo", "bar" ]
                  , uri = "=404"
                  }
                , uri = "/"
                }
              , ng.location::{
                , default_type = Some "foo"
                , fastcgi_intercept_errors = Some True
                , log_subrequest = Some True
                , max_ranges = Some 512
                , msie_padding = Some False
                , modifier = ng.location.modifier.regexCaseInsensitive
                , uri = "^/users/(.+\\.(?:gif|jpe?g|png))\$"
                }
              , ng.location::{
                , default_type = Some "bar"
                , log_subrequest = Some False
                , max_ranges = None Natural
                , msie_padding = Some True
                , uri = "@bar"
                }
              ]
            , log_not_found = Some False
            , root = Some "/var/root"
            , satisfy = Some ng.satisfy.all
            , server_name = [ "hello.net", "there.com" ]
            , tcp_nodelay = Some True
            , try_files = Some ng.try_files::{
              , files = [ "index.html", "test.php" ]
              , uri = "/foo"
              }
            }
          ]
        , types = Some (toMap { fruits = [ "apple", "banana" ] })
        , default_type = Some "text/html"
        , upstream =
          [ ng.upstream::{
            , name = "django"
            , ntlm = Some {=}
            , server =
              [ ng.upstream.server::{
                , address = "localhost"
                , fail_timeout = Some ng.Interval::{ minutes = Some 4 }
                }
              ]
            }
          ]
        }
      , load_modules =
        [ "modules/ngx_mail_module.so", "modules/ngx_http_geoip_module.so" ]
      , pcre_jit = Some True
      , pid = Some "pidfile"
      , error_log = Some ng.error_log::{
        , file = "/tmp/error.log"
        , level = Some ng.LogLevel.warn
        }
      }

in  ng.config.make 0 config
