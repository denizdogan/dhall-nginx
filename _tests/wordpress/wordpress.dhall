let ng = ../../package.dhall

let http =
      ng.http::{
      , upstream =
        [ ng.upstream::{
          , name = "php"
          , server =
            [ ng.upstream.server::{ address = "unix:/tmp/php-cgi.socket" }
            , ng.upstream.server::{ address = "127.0.0.1:9000" }
            ]
          }
        ]
      , server =
        [ ng.server::{
          , server_name = [ "domain.tld" ]
          , root = Some "/var/www/wordpress"
          , index = Some [ "index.php" ]
          , location =
            [ ng.location::{
              , access_log = Some ng.access_log.off
              , log_not_found = Some False
              , modifier = ng.location.modifier.exact
              , uri = "/favicon.ico"
              }
            , ng.location::{
              , access_log = Some ng.access_log.off
              , access_rules = [ ng.allow "all" ]
              , log_not_found = Some False
              , modifier = ng.location.modifier.exact
              , uri = "/robots.txt"
              }
            , ng.location::{
              , uri = "/"
              , try_files = Some ng.try_files::{
                , files = [ "\$uri", "\$uri/" ]
                , uri = "/index.php?\$args"
                }
              }
            , ng.location::{
              , modifier = ng.location.modifier.regexCaseSensitive
              , uri = "\\.php\$"
              , fastcgi_intercept_errors = Some True
              , fastcgi_pass = Some "php"
              , fastcgi_param = ng.helpers.fastcgi_params
              }
            , ng.location::{
              , log_not_found = Some False
              , modifier = ng.location.modifier.regexCaseInsensitive
              , uri = "\\.(js|css|png|jpg|jpeg|gif|ico)\$"
              , expires = Some ng.expires::{ time = ng.expires.Expires.max }
              , fastcgi_param = ng.helpers.fastcgi_params
              }
            ]
          }
        ]
      }

let config =
      ng.config::{
      , events = ng.events::{=}
      , http = Some http
      , pid = Some "pidfile"
      , error_log = Some ng.error_log::{
        , file = "/tmp/error.log"
        , level = Some ng.LogLevel.warn
        }
      }

in  ng.config.make 0 config
