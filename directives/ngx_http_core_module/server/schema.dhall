let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let indent = ../../../utils/indent.dhall

let optList = ../../../utils/optList.dhall

let access_log = ../../ngx_http_log_module/access_log/schema.dhall

let access_rule = ../../ngx_http_access_module/access_rule/schema.dhall

let add_header = ../../ngx_http_headers_module/add_header/schema.dhall

let add_trailer = ../../ngx_http_headers_module/add_trailer/schema.dhall

let default_type = ../default_type/schema.dhall

let expires = ../../ngx_http_headers_module/expires/schema.dhall

let fastcgi_intercept_errors =
      ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/schema.dhall

let fastcgi_param = ../../ngx_http_fastcgi_module/fastcgi_param/schema.dhall

let location = ../location/schema.dhall

let log_not_found = ../log_not_found/schema.dhall

let root = ../../ngx_http_core_module/root/schema.dhall

let satisfy = ../satisfy/schema.dhall

let server_name = ../server_name/schema.dhall

let tcp_nodelay = ../tcp_nodelay/schema.dhall

let try_files = ../try_files/schema.dhall

let index = ../../ngx_http_index_module/index/schema.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let access_log =
              Optional/map
                access_log.Type
                Text
                (access_log.make (n + 2))
                c.access_log

        let access_rules =
              optList access_rule.Type (access_rule.make (n + 2)) c.access_rules

        let add_header =
              optList add_header.Type (add_header.make (n + 2)) c.add_header

        let add_trailer =
              optList add_trailer.Type (add_trailer.make (n + 2)) c.add_trailer

        let default_type =
              Optional/map
                default_type.Type
                Text
                (default_type.make (n + 2))
                c.default_type

        let expires =
              Optional/map expires.Type Text (expires.make (n + 2)) c.expires

        let fastcgi_intercept_errors =
              Optional/map
                Bool
                Text
                (fastcgi_intercept_errors.make (n + 2))
                c.fastcgi_intercept_errors

        let fastcgi_params =
              optList
                fastcgi_param.Type
                (fastcgi_param.make (n + 2))
                c.fastcgi_param

        let index = Optional/map index.Type Text (index.make (n + 2)) c.index

        let location = optList location.Type (location.make (n + 2)) c.location

        let log_not_found =
              Optional/map
                log_not_found.Type
                Text
                (log_not_found.make (n + 2))
                c.log_not_found

        let root = Optional/map root.Type Text (root.make (n + 2)) c.root

        let satisfy =
              Optional/map satisfy.Type Text (satisfy.make (n + 2)) c.satisfy

        let server_name =
              if    Natural/isZero (List/length Text c.server_name)
              then  None Text
              else  Some (server_name.make (n + 2) c.server_name)

        let tcp_nodelay = tcp_nodelay.opt (n + 2) c.tcp_nodelay

        let try_files =
              Optional/map
                try_files.Type
                Text
                (try_files.make (n + 2))
                c.try_files

        let directives =
              List/unpackOptionals
                Text
                [ access_log
                , access_rules
                , add_header
                , add_trailer
                , default_type
                , expires
                , fastcgi_intercept_errors
                , fastcgi_params
                , index
                , location
                , log_not_found
                , root
                , satisfy
                , server_name
                , tcp_nodelay
                , try_files
                ]

        in  Text/concatSep
              "\n"
              [ indent n "server {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  { Type = type, default, make }
