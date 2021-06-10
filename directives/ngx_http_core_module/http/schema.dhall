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

let fcgi = ../../ngx_http_fastcgi_module/package.dhall

let fastcgi_buffering = fcgi.fastcgi_buffering

let fastcgi_cache_background_update = fcgi.fastcgi_cache_background_update

let fastcgi_cache_key = fcgi.fastcgi_cache_key

let fastcgi_cache_lock = fcgi.fastcgi_cache_lock

let fastcgi_cache_lock_age = fcgi.fastcgi_cache_lock_age

let fastcgi_cache_lock_timeout = fcgi.fastcgi_cache_lock_timeout

let fastcgi_cache_max_range_offset = fcgi.fastcgi_cache_max_range_offset

let fastcgi_cache_min_uses = fcgi.fastcgi_cache_min_uses

let fastcgi_cache_revalidate = fcgi.fastcgi_cache_revalidate

let fastcgi_catch_stderr = fcgi.fastcgi_catch_stderr

let fastcgi_connect_timeout = fcgi.fastcgi_connect_timeout

let fastcgi_force_ranges = fcgi.fastcgi_force_ranges

let fastcgi_hide_header = fcgi.fastcgi_hide_header

let fastcgi_ignore_client_abort = fcgi.fastcgi_ignore_client_abort

let fastcgi_index = fcgi.fastcgi_index

let fastcgi_intercept_errors = fcgi.fastcgi_intercept_errors

let fastcgi_keep_conn = fcgi.fastcgi_keep_conn

let fastcgi_limit_rate = fcgi.fastcgi_limit_rate

let fastcgi_next_upstream_timeout = fcgi.fastcgi_next_upstream_timeout

let fastcgi_next_upstream_tries = fcgi.fastcgi_next_upstream_tries

let fastcgi_pass_header = fcgi.fastcgi_pass_header

let fastcgi_pass_request_body = fcgi.fastcgi_pass_request_body

let fastcgi_read_timeout = fcgi.fastcgi_read_timeout

let fastcgi_request_buffering = fcgi.fastcgi_request_buffering

let fastcgi_send_timeout = fcgi.fastcgi_send_timeout

let fastcgi_socket_keepalive = fcgi.fastcgi_socket_keepalive

let fastcgi_param = fcgi.fastcgi_param

let absolute_redirect = ../absolute_redirect/schema.dhall

let aio_write = ../aio_write/schema.dhall

let auth_delay = ../auth_delay/schema.dhall

let chunked_transfer_encoding = ../chunked_transfer_encoding/schema.dhall

let client_body_in_single_buffer = ../client_body_in_single_buffer/schema.dhall

let client_body_timeout = ../client_body_timeout/schema.dhall

let ignore_invalid_headers = ../ignore_invalid_headers/schema.dhall

let keepalive_requests = ../keepalive_requests/schema.dhall

let keepalive_time = ../keepalive_time/schema.dhall

let lingering_time = ../lingering_time/schema.dhall

let lingering_timeout = ../lingering_timeout/schema.dhall

let merge_slashes = ../merge_slashes/schema.dhall

let msie_refresh = ../msie_refresh/schema.dhall

let open_file_cache_errors = ../open_file_cache_errors/schema.dhall

let open_file_cache_min_uses = ../open_file_cache_min_uses/schema.dhall

let open_file_cache_valid = ../open_file_cache_valid/schema.dhall

let port_in_redirect = ../port_in_redirect/schema.dhall

let recursive_error_pages = ../recursive_error_pages/schema.dhall

let reset_timedout_connection = ../reset_timedout_connection/schema.dhall

let resolver_timeout = ../resolver_timeout/schema.dhall

let send_timeout = ../send_timeout/schema.dhall

let server_name_in_redirect = ../server_name_in_redirect/schema.dhall

let tcp_nopush = ../tcp_nopush/schema.dhall

let underscores_in_headers = ../underscores_in_headers/schema.dhall

let log_format = ../../ngx_http_log_module/log_format/schema.dhall

let map = ../../ngx_http_map_module/map/schema.dhall

let satisfy = ../satisfy/schema.dhall

let upstream = ../../ngx_http_upstream_module/upstream/schema.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let absolute_redirect =
              absolute_redirect.opt c.absolute_redirect (n + 2)

        let access_rules =
              optList access_rule.Type (access_rule.make (n + 2)) c.access_rules

        let add_header =
              optList add_header.Type (add_header.make (n + 2)) c.add_header

        let add_trailer =
              optList add_trailer.Type (add_trailer.make (n + 2)) c.add_trailer

        let aio_write = aio_write.opt c.aio_write (n + 2)

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

        let auth_delay = auth_delay.opt c.auth_delay (n + 2)

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

        let chunked_transfer_encoding =
              chunked_transfer_encoding.opt c.chunked_transfer_encoding (n + 2)

        let client_body_in_single_buffer =
              client_body_in_single_buffer.opt
                c.client_body_in_single_buffer
                (n + 2)

        let client_body_timeout =
              client_body_timeout.opt c.client_body_timeout (n + 2)

        let default_type =
              Optional/map
                default_type.Type
                Text
                (default_type.make (n + 2))
                c.default_type

        let expires =
              Optional/map expires.Type Text (expires.make (n + 2)) c.expires

        let fastcgi_buffering =
              fastcgi_buffering.opt c.fastcgi_buffering (n + 2)

        let fastcgi_cache_background_update =
              fastcgi_cache_background_update.opt
                c.fastcgi_cache_background_update
                (n + 2)

        let fastcgi_cache_key =
              fastcgi_cache_key.opt c.fastcgi_cache_key (n + 2)

        let fastcgi_cache_lock =
              fastcgi_cache_lock.opt c.fastcgi_cache_lock (n + 2)

        let fastcgi_cache_lock_age =
              fastcgi_cache_lock_age.opt c.fastcgi_cache_lock_age (n + 2)

        let fastcgi_cache_lock_timeout =
              fastcgi_cache_lock_timeout.opt
                c.fastcgi_cache_lock_timeout
                (n + 2)

        let fastcgi_cache_max_range_offset =
              fastcgi_cache_max_range_offset.opt
                c.fastcgi_cache_max_range_offset
                (n + 2)

        let fastcgi_cache_min_uses =
              fastcgi_cache_min_uses.opt c.fastcgi_cache_min_uses (n + 2)

        let fastcgi_cache_revalidate =
              fastcgi_cache_revalidate.opt c.fastcgi_cache_revalidate (n + 2)

        let fastcgi_catch_stderr =
              fastcgi_catch_stderr.opt c.fastcgi_catch_stderr (n + 2)

        let fastcgi_connect_timeout =
              fastcgi_connect_timeout.opt c.fastcgi_connect_timeout (n + 2)

        let fastcgi_force_ranges =
              fastcgi_force_ranges.opt c.fastcgi_force_ranges (n + 2)

        let fastcgi_hide_header =
              fastcgi_hide_header.opt c.fastcgi_hide_header (n + 2)

        let fastcgi_ignore_client_abort =
              fastcgi_ignore_client_abort.opt
                c.fastcgi_ignore_client_abort
                (n + 2)

        let fastcgi_index = fastcgi_index.opt c.fastcgi_index (n + 2)

        let fastcgi_intercept_errors =
              fastcgi_intercept_errors.opt c.fastcgi_intercept_errors (n + 2)

        let fastcgi_keep_conn =
              fastcgi_keep_conn.opt c.fastcgi_keep_conn (n + 2)

        let fastcgi_limit_rate =
              fastcgi_limit_rate.opt c.fastcgi_limit_rate (n + 2)

        let fastcgi_next_upstream_timeout =
              fastcgi_next_upstream_timeout.opt
                c.fastcgi_next_upstream_timeout
                (n + 2)

        let fastcgi_next_upstream_tries =
              fastcgi_next_upstream_tries.opt
                c.fastcgi_next_upstream_tries
                (n + 2)

        let fastcgi_pass_header =
              fastcgi_pass_header.opt c.fastcgi_pass_header (n + 2)

        let fastcgi_pass_request_body =
              fastcgi_pass_request_body.opt c.fastcgi_pass_request_body (n + 2)

        let fastcgi_read_timeout =
              fastcgi_read_timeout.opt c.fastcgi_read_timeout (n + 2)

        let fastcgi_request_buffering =
              fastcgi_request_buffering.opt c.fastcgi_request_buffering (n + 2)

        let fastcgi_send_timeout =
              fastcgi_send_timeout.opt c.fastcgi_send_timeout (n + 2)

        let fastcgi_socket_keepalive =
              fastcgi_socket_keepalive.opt c.fastcgi_socket_keepalive (n + 2)

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

        let ignore_invalid_headers =
              ignore_invalid_headers.opt c.ignore_invalid_headers (n + 2)

        let index = Optional/map index.Type Text (index.make (n + 2)) c.index

        let keepalive_requests =
              keepalive_requests.opt c.keepalive_requests (n + 2)

        let keepalive_time = keepalive_time.opt c.keepalive_time (n + 2)

        let lingering_time = lingering_time.opt c.lingering_time (n + 2)

        let lingering_timeout =
              lingering_timeout.opt c.lingering_timeout (n + 2)

        let log_formats =
              optList log_format.Type (log_format.make (n + 2)) c.log_format

        let log_not_found =
              Optional/map
                log_not_found.Type
                Text
                (log_not_found.make (n + 2))
                c.log_not_found

        let map = optList map.Type (map.make (n + 2)) c.map

        let merge_slashes = merge_slashes.opt c.merge_slashes (n + 2)

        let msie_refresh = msie_refresh.opt c.msie_refresh (n + 2)

        let open_file_cache_errors =
              open_file_cache_errors.opt c.open_file_cache_errors (n + 2)

        let open_file_cache_min_uses =
              open_file_cache_min_uses.opt c.open_file_cache_min_uses (n + 2)

        let open_file_cache_valid =
              open_file_cache_valid.opt c.open_file_cache_valid (n + 2)

        let port_in_redirect = port_in_redirect.opt c.port_in_redirect (n + 2)

        let recursive_error_pages =
              recursive_error_pages.opt c.recursive_error_pages (n + 2)

        let reset_timedout_connection =
              reset_timedout_connection.opt c.reset_timedout_connection (n + 2)

        let resolver_timeout = resolver_timeout.opt c.resolver_timeout (n + 2)

        let satisfy =
              Optional/map satisfy.Type Text (satisfy.make (n + 2)) c.satisfy

        let send_timeout = send_timeout.opt c.send_timeout (n + 2)

        let sendfile =
              Optional/map sendfile.Type Text (sendfile.make (n + 2)) c.sendfile

        let server = optList server.Type (server.make (n + 2)) c.server

        let server_name_in_redirect =
              server_name_in_redirect.opt c.server_name_in_redirect (n + 2)

        let tcp_nopush = tcp_nopush.opt c.tcp_nopush (n + 2)

        let types = Optional/map types.Type Text (types.make (n + 2)) c.types

        let underscores_in_headers =
              underscores_in_headers.opt c.underscores_in_headers (n + 2)

        let upstream = optList upstream.Type (upstream.make (n + 2)) c.upstream

        let directives =
              List/unpackOptionals
                Text
                [ absolute_redirect
                , access_rules
                , add_header
                , add_trailer
                , aio_write
                , auth_basic
                , auth_basic_user_file
                , auth_delay
                , autoindex
                , autoindex_exact_size
                , autoindex_format
                , autoindex_localtime
                , chunked_transfer_encoding
                , client_body_in_single_buffer
                , client_body_timeout
                , default_type
                , expires
                , fastcgi_buffering
                , fastcgi_cache_background_update
                , fastcgi_cache_key
                , fastcgi_cache_lock
                , fastcgi_cache_lock_age
                , fastcgi_cache_lock_timeout
                , fastcgi_cache_max_range_offset
                , fastcgi_cache_min_uses
                , fastcgi_cache_revalidate
                , fastcgi_catch_stderr
                , fastcgi_connect_timeout
                , fastcgi_force_ranges
                , fastcgi_hide_header
                , fastcgi_ignore_client_abort
                , fastcgi_index
                , fastcgi_intercept_errors
                , fastcgi_keep_conn
                , fastcgi_limit_rate
                , fastcgi_next_upstream_timeout
                , fastcgi_next_upstream_tries
                , fastcgi_params
                , fastcgi_pass_header
                , fastcgi_pass_request_body
                , fastcgi_read_timeout
                , fastcgi_request_buffering
                , fastcgi_send_timeout
                , fastcgi_socket_keepalive
                , if_modified_since
                , ignore_invalid_headers
                , index
                , keepalive_requests
                , keepalive_time
                , lingering_time
                , lingering_timeout
                , log_formats
                , log_not_found
                , map
                , merge_slashes
                , msie_refresh
                , open_file_cache_errors
                , open_file_cache_min_uses
                , open_file_cache_valid
                , port_in_redirect
                , recursive_error_pages
                , reset_timedout_connection
                , resolver_timeout
                , satisfy
                , send_timeout
                , sendfile
                , server
                , server_name_in_redirect
                , tcp_nopush
                , types
                , underscores_in_headers
                , upstream
                ]

        in  Text/concatSep
              "\n"
              [ indent n "http {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  { Type = type, default, make }
