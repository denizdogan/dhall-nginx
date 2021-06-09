let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let indent = ../../../utils/indent.dhall

let optList = ../../../utils/optList.dhall

let if_modified_since = ../if_modified_since/schema.dhall

let access_rule = ../../ngx_http_access_module/access_rule/schema.dhall

let add_header = ../../ngx_http_headers_module/add_header/schema.dhall

let add_trailer = ../../ngx_http_headers_module/add_trailer/schema.dhall

let auth_basic = ../../ngx_http_auth_basic_module/auth_basic/schema.dhall

let auth_basic_user_file =
      ../../ngx_http_auth_basic_module/auth_basic_user_file/schema.dhall

let autoindex = ../../ngx_http_autoindex_module/autoindex/schema.dhall

let autoindex_exact_size =
      ../../ngx_http_autoindex_module/autoindex_exact_size/schema.dhall

let autoindex_format =
      ../../ngx_http_autoindex_module/autoindex_format/schema.dhall

let autoindex_localtime =
      ../../ngx_http_autoindex_module/autoindex_localtime/schema.dhall

let index = ../../ngx_http_index_module/index/schema.dhall

let log_not_found = ../log_not_found/schema.dhall

let sendfile = ../sendfile/schema.dhall

let server = ../server/schema.dhall

let types = ../types/schema.dhall

let default_type = ../default_type/schema.dhall

let expires = ../../ngx_http_headers_module/expires/schema.dhall

let ngx_http_fastcgi_module = ../../ngx_http_fastcgi_module/package.dhall

let fastcgi_intercept_errors = ngx_http_fastcgi_module.fastcgi_intercept_errors

let fastcgi_param = ../../ngx_http_fastcgi_module/fastcgi_param/schema.dhall

let log_format = ../../ngx_http_log_module/log_format/schema.dhall

let map = ../../ngx_http_map_module/map/schema.dhall

let satisfy = ../satisfy/schema.dhall

let upstream = ../../ngx_http_upstream_module/upstream/schema.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let access_rules =
              optList access_rule.Type (access_rule.make (n + 2)) c.access_rules

        let add_header =
              optList add_header.Type (add_header.make (n + 2)) c.add_header

        let add_trailer =
              optList add_trailer.Type (add_trailer.make (n + 2)) c.add_trailer

        let auth_basic =
              Optional/map
                auth_basic.Type
                Text
                (auth_basic.make (n + 2))
                c.auth_basic

        let auth_basic_user_file =
              Optional/map
                auth_basic_user_file.Type
                Text
                (auth_basic_user_file.make (n + 2))
                c.auth_basic_user_file

        let autoindex =
              Optional/map
                autoindex.Type
                Text
                (autoindex.make (n + 2))
                c.autoindex

        let autoindex_exact_size =
              Optional/map
                autoindex_exact_size.Type
                Text
                (autoindex_exact_size.make (n + 2))
                c.autoindex_exact_size

        let autoindex_format =
              Optional/map
                autoindex_format.Type
                Text
                (autoindex_format.make (n + 2))
                c.autoindex_format

        let autoindex_localtime =
              Optional/map
                autoindex_localtime.Type
                Text
                (autoindex_localtime.make (n + 2))
                c.autoindex_localtime

        let default_type =
              Optional/map
                default_type.Type
                Text
                (default_type.make (n + 2))
                c.default_type

        let expires =
              Optional/map expires.Type Text (expires.make (n + 2)) c.expires

        let fastcgi_intercept_errors =
              fastcgi_intercept_errors.opt c.fastcgi_intercept_errors (n + 2)

        let fastcgi_params =
              optList
                fastcgi_param.Type
                (fastcgi_param.make (n + 2))
                c.fastcgi_param

        let if_modified_since =
              Optional/map
                if_modified_since.Type
                Text
                (if_modified_since.make (n + 2))
                c.if_modified_since

        let index = Optional/map index.Type Text (index.make (n + 2)) c.index

        let log_formats =
              optList log_format.Type (log_format.make (n + 2)) c.log_format

        let log_not_found =
              Optional/map
                log_not_found.Type
                Text
                (log_not_found.make (n + 2))
                c.log_not_found

        let map = optList map.Type (map.make (n + 2)) c.map

        let satisfy =
              Optional/map satisfy.Type Text (satisfy.make (n + 2)) c.satisfy

        let sendfile =
              Optional/map sendfile.Type Text (sendfile.make (n + 2)) c.sendfile

        let server = optList server.Type (server.make (n + 2)) c.server

        let types = Optional/map types.Type Text (types.make (n + 2)) c.types

        let upstream = optList upstream.Type (upstream.make (n + 2)) c.upstream

        let directives =
              List/unpackOptionals
                Text
                [ access_rules
                , add_header
                , add_trailer
                , auth_basic
                , auth_basic_user_file
                , autoindex
                , autoindex_exact_size
                , autoindex_format
                , autoindex_localtime
                , default_type
                , expires
                , fastcgi_intercept_errors
                , fastcgi_params
                , if_modified_since
                , index
                , log_formats
                , log_not_found
                , map
                , satisfy
                , sendfile
                , server
                , types
                , upstream
                ]

        in  Text/concatSep
              "\n"
              [ indent n "http {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  { Type = type, default, make }
