let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let type = ./type.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let optList = ../../../utils/optList.dhall

let access_log = ../../ngx_http_log_module/access_log/schema.dhall

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

let client_body_buffer_size = ../client_body_buffer_size/schema.dhall

let client_max_body_size = ../client_max_body_size/schema.dhall

let connection_pool_size = ../connection_pool_size/schema.dhall

let directio = ../directio/schema.dhall

let directio_alignment = ../directio_alignment/schema.dhall

let default_type = ../default_type/schema.dhall

let expires = ../../ngx_http_headers_module/expires/schema.dhall

let index = ../../ngx_http_index_module/index/schema.dhall

let log_not_found = ../log_not_found/schema.dhall

let log_subrequest = ../log_subrequest/schema.dhall

let max_ranges = ../max_ranges/schema.dhall

let msie_padding = ../msie_padding/schema.dhall

let try_files = ../try_files/schema.dhall

let modifier = ./modifier.dhall

let fastcgi_param = ../../ngx_http_fastcgi_module/fastcgi_param/schema.dhall

let ngx_http_fastcgi_module = ../../ngx_http_fastcgi_module/package.dhall

let fastcgi_buffering =
      ../../ngx_http_fastcgi_module/fastcgi_buffering/schema.dhall

let fastcgi_cache_background_update =
      ../../ngx_http_fastcgi_module/fastcgi_cache_background_update/schema.dhall

let fastcgi_cache_key =
      ../../ngx_http_fastcgi_module/fastcgi_cache_key/schema.dhall

let fastcgi_cache_lock =
      ../../ngx_http_fastcgi_module/fastcgi_cache_lock/schema.dhall

let fastcgi_cache_max_range_offset =
      ../../ngx_http_fastcgi_module/fastcgi_cache_max_range_offset/schema.dhall

let fastcgi_cache_min_uses =
      ../../ngx_http_fastcgi_module/fastcgi_cache_min_uses/schema.dhall

let fastcgi_cache_revalidate =
      ../../ngx_http_fastcgi_module/fastcgi_cache_revalidate/schema.dhall

let fastcgi_catch_stderr =
      ../../ngx_http_fastcgi_module/fastcgi_catch_stderr/schema.dhall

let fastcgi_force_ranges =
      ../../ngx_http_fastcgi_module/fastcgi_force_ranges/schema.dhall

let fastcgi_hide_header =
      ../../ngx_http_fastcgi_module/fastcgi_hide_header/schema.dhall

let fastcgi_ignore_client_abort =
      ../../ngx_http_fastcgi_module/fastcgi_ignore_client_abort/schema.dhall

let fastcgi_index = ../../ngx_http_fastcgi_module/fastcgi_index/schema.dhall

let fastcgi_intercept_errors = ngx_http_fastcgi_module.fastcgi_intercept_errors

let fastcgi_keep_conn =
      ../../ngx_http_fastcgi_module/fastcgi_keep_conn/schema.dhall

let fastcgi_limit_rate =
      ../../ngx_http_fastcgi_module/fastcgi_limit_rate/schema.dhall

let fastcgi_next_upstream_tries =
      ../../ngx_http_fastcgi_module/fastcgi_next_upstream_tries/schema.dhall

let fastcgi_pass_header =
      ../../ngx_http_fastcgi_module/fastcgi_pass_header/schema.dhall

let fastcgi_pass_request_body =
      ../../ngx_http_fastcgi_module/fastcgi_pass_request_body/schema.dhall

let fastcgi_request_buffering =
      ../../ngx_http_fastcgi_module/fastcgi_request_buffering/schema.dhall

let fastcgi_socket_keepalive =
      ../../ngx_http_fastcgi_module/fastcgi_socket_keepalive/schema.dhall

let fastcgi_pass = ngx_http_fastcgi_module.fastcgi_pass

let satisfy = ../satisfy/schema.dhall

let absolute_redirect = ../absolute_redirect/schema.dhall

let aio_write = ../aio_write/schema.dhall

let auth_delay = ../auth_delay/schema.dhall

let chunked_transfer_encoding = ../chunked_transfer_encoding/schema.dhall

let client_body_in_single_buffer = ../client_body_in_single_buffer/schema.dhall

let client_body_timeout = ../client_body_timeout/schema.dhall

let keepalive_requests = ../keepalive_requests/schema.dhall

let keepalive_time = ../keepalive_time/schema.dhall

let limit_rate_after = ../limit_rate_after/schema.dhall

let lingering_time = ../lingering_time/schema.dhall

let lingering_timeout = ../lingering_timeout/schema.dhall

let msie_refresh = ../msie_refresh/schema.dhall

let open_file_cache_errors = ../open_file_cache_errors/schema.dhall

let open_file_cache_min_uses = ../open_file_cache_min_uses/schema.dhall

let open_file_cache_valid = ../open_file_cache_valid/schema.dhall

let port_in_redirect = ../port_in_redirect/schema.dhall

let postpone_output = ../postpone_output/schema.dhall

let recursive_error_pages = ../recursive_error_pages/schema.dhall

let reset_timedout_connection = ../reset_timedout_connection/schema.dhall

let resolver_timeout = ../resolver_timeout/schema.dhall

let send_lowat = ../send_lowat/schema.dhall

let send_timeout = ../send_timeout/schema.dhall

let sendfile_max_chunk = ../sendfile_max_chunk/schema.dhall

let server_name_in_redirect = ../server_name_in_redirect/schema.dhall

let subrequest_output_buffer_size =
      ../subrequest_output_buffer_size/schema.dhall

let tcp_nopush = ../tcp_nopush/schema.dhall

let types_hash_bucket_size = ../types_hash_bucket_size/schema.dhall

let types_hash_max_size = ../types_hash_max_size/schema.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let absolute_redirect =
              absolute_redirect.opt c.absolute_redirect (n + 2)

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

        let client_body_buffer_size =
              client_body_buffer_size.opt c.client_body_buffer_size (n + 2)

        let client_body_in_single_buffer =
              client_body_in_single_buffer.opt
                c.client_body_in_single_buffer
                (n + 2)

        let client_body_timeout =
              client_body_timeout.opt c.client_body_timeout (n + 2)

        let client_max_body_size =
              client_max_body_size.opt c.client_max_body_size (n + 2)

        let connection_pool_size =
              connection_pool_size.opt c.connection_pool_size (n + 2)

        let default_type =
              Optional/map Text Text (default_type.make (n + 2)) c.default_type

        let directio = directio.opt c.directio (n + 2)

        let directio_alignment =
              directio_alignment.opt c.directio_alignment (n + 2)

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

        let fastcgi_next_upstream_tries =
              fastcgi_next_upstream_tries.opt
                c.fastcgi_next_upstream_tries
                (n + 2)

        let fastcgi_pass = fastcgi_pass.opt c.fastcgi_pass (n + 2)

        let fastcgi_pass_header =
              fastcgi_pass_header.opt c.fastcgi_pass_header (n + 2)

        let fastcgi_pass_request_body =
              fastcgi_pass_request_body.opt c.fastcgi_pass_request_body (n + 2)

        let fastcgi_request_buffering =
              fastcgi_request_buffering.opt c.fastcgi_request_buffering (n + 2)

        let fastcgi_socket_keepalive =
              fastcgi_socket_keepalive.opt c.fastcgi_socket_keepalive (n + 2)

        let fastcgi_params =
              optList
                fastcgi_param.Type
                (fastcgi_param.make (n + 2))
                c.fastcgi_param

        let index = Optional/map index.Type Text (index.make (n + 2)) c.index

        let keepalive_requests =
              keepalive_requests.opt c.keepalive_requests (n + 2)

        let keepalive_time = keepalive_time.opt c.keepalive_time (n + 2)

        let limit_rate_after = limit_rate_after.opt c.limit_rate_after (n + 2)

        let lingering_time = lingering_time.opt c.lingering_time (n + 2)

        let lingering_timeout =
              lingering_timeout.opt c.lingering_timeout (n + 2)

        let log_not_found =
              Optional/map
                log_not_found.Type
                Text
                (log_not_found.make (n + 2))
                c.log_not_found

        let log_subrequest =
              Optional/map
                Bool
                Text
                (log_subrequest.make (n + 2))
                c.log_subrequest

        let max_ranges =
              Optional/map Natural Text (max_ranges.make (n + 2)) c.max_ranges

        let msie_refresh = msie_refresh.opt c.msie_refresh (n + 2)

        let open_file_cache_errors =
              open_file_cache_errors.opt c.open_file_cache_errors (n + 2)

        let open_file_cache_min_uses =
              open_file_cache_min_uses.opt c.open_file_cache_min_uses (n + 2)

        let open_file_cache_valid =
              open_file_cache_valid.opt c.open_file_cache_valid (n + 2)

        let port_in_redirect = port_in_redirect.opt c.port_in_redirect (n + 2)

        let postpone_output = postpone_output.opt c.postpone_output (n + 2)

        let recursive_error_pages =
              recursive_error_pages.opt c.recursive_error_pages (n + 2)

        let reset_timedout_connection =
              reset_timedout_connection.opt c.reset_timedout_connection (n + 2)

        let resolver_timeout = resolver_timeout.opt c.resolver_timeout (n + 2)

        let msie_padding =
              Optional/map Bool Text (msie_padding.make (n + 2)) c.msie_padding

        let satisfy =
              Optional/map satisfy.Type Text (satisfy.make (n + 2)) c.satisfy

        let send_lowat = send_lowat.opt c.send_lowat (n + 2)

        let send_timeout = send_timeout.opt c.send_timeout (n + 2)

        let sendfile_max_chunk =
              sendfile_max_chunk.opt c.sendfile_max_chunk (n + 2)

        let server_name_in_redirect =
              server_name_in_redirect.opt c.server_name_in_redirect (n + 2)

        let subrequest_output_buffer_size =
              subrequest_output_buffer_size.opt
                c.subrequest_output_buffer_size
                (n + 2)

        let tcp_nopush = tcp_nopush.opt c.tcp_nopush (n + 2)

        let try_files =
              Optional/map
                try_files.Type
                Text
                (try_files.make (n + 2))
                c.try_files

        let types_hash_bucket_size =
              types_hash_bucket_size.opt c.types_hash_bucket_size (n + 2)

        let types_hash_max_size =
              types_hash_max_size.opt c.types_hash_max_size (n + 2)

        let directives =
              List/unpackOptionals
                Text
                [ absolute_redirect
                , access_log
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
                , client_body_buffer_size
                , client_body_in_single_buffer
                , client_body_timeout
                , client_max_body_size
                , connection_pool_size
                , default_type
                , directio
                , directio_alignment
                , expires
                , fastcgi_buffering
                , fastcgi_cache_background_update
                , fastcgi_cache_key
                , fastcgi_cache_lock
                , fastcgi_cache_max_range_offset
                , fastcgi_cache_min_uses
                , fastcgi_cache_revalidate
                , fastcgi_catch_stderr
                , fastcgi_force_ranges
                , fastcgi_hide_header
                , fastcgi_ignore_client_abort
                , fastcgi_index
                , fastcgi_intercept_errors
                , fastcgi_keep_conn
                , fastcgi_limit_rate
                , fastcgi_next_upstream_tries
                , fastcgi_params
                , fastcgi_pass
                , fastcgi_pass_header
                , fastcgi_pass_request_body
                , fastcgi_request_buffering
                , fastcgi_socket_keepalive
                , index
                , keepalive_requests
                , keepalive_time
                , limit_rate_after
                , lingering_time
                , lingering_timeout
                , log_not_found
                , log_subrequest
                , max_ranges
                , msie_padding
                , msie_refresh
                , open_file_cache_errors
                , open_file_cache_min_uses
                , open_file_cache_valid
                , port_in_redirect
                , postpone_output
                , recursive_error_pages
                , reset_timedout_connection
                , resolver_timeout
                , satisfy
                , satisfy
                , send_lowat
                , send_timeout
                , sendfile_max_chunk
                , server_name_in_redirect
                , subrequest_output_buffer_size
                , tcp_nopush
                , try_files
                , types_hash_bucket_size
                , types_hash_max_size
                ]

        let nameOrUri =
              merge
                { Some = λ(n : Text) → "@" ++ n
                , None =
                    let modif =
                          merge
                            { exact = "= "
                            , regexCaseSensitive = "~ "
                            , regexCaseInsensitive = "~* "
                            , regexPrefix = "^~ "
                            , prefix = ""
                            }
                            c.modifier

                    in  "${modif}${c.uri}"
                }
                c.name

        in  Text/concatSep
              "\n"
              [ indent n "location ${nameOrUri} {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  { Type = type, default, make, modifier }
