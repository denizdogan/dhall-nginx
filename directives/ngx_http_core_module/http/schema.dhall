let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let directives = ../../../utils/directives.dhall

let indent = ../../../utils/indent.dhall

let absolute_redirect = ../absolute_redirect/schema.dhall

let access_log = ../../ngx_http_log_module/access_log/schema.dhall

let access_rule = ../../ngx_http_access_module/access_rule/schema.dhall

let add_header = ../../ngx_http_headers_module/add_header/schema.dhall

let add_trailer = ../../ngx_http_headers_module/add_trailer/schema.dhall

let aio_write = ../aio_write/schema.dhall

let auth_basic = ../../ngx_http_auth_basic_module/auth_basic/schema.dhall

let auth_basic_user_file =
      ../../ngx_http_auth_basic_module/auth_basic_user_file/schema.dhall

let auth_delay = ../auth_delay/schema.dhall

let autoindex = ../../ngx_http_autoindex_module/autoindex/schema.dhall

let autoindex_exact_size =
      ../../ngx_http_autoindex_module/autoindex_exact_size/schema.dhall

let autoindex_format =
      ../../ngx_http_autoindex_module/autoindex_format/schema.dhall

let autoindex_localtime =
      ../../ngx_http_autoindex_module/autoindex_localtime/schema.dhall

let chunked_transfer_encoding = ../chunked_transfer_encoding/schema.dhall

let client_body_buffer_size = ../client_body_buffer_size/schema.dhall

let client_body_in_single_buffer = ../client_body_in_single_buffer/schema.dhall

let client_body_timeout = ../client_body_timeout/schema.dhall

let client_header_buffer_size = ../client_header_buffer_size/schema.dhall

let client_max_body_size = ../client_max_body_size/schema.dhall

let connection_pool_size = ../connection_pool_size/schema.dhall

let default_type = ../default_type/schema.dhall

let directio = ../directio/schema.dhall

let directio_alignment = ../directio_alignment/schema.dhall

let expires = ../../ngx_http_headers_module/expires/schema.dhall

let fastcgi_buffering =
      ../../ngx_http_fastcgi_module/fastcgi_buffering/schema.dhall

let fastcgi_cache_background_update =
      ../../ngx_http_fastcgi_module/fastcgi_cache_background_update/schema.dhall

let fastcgi_cache_key =
      ../../ngx_http_fastcgi_module/fastcgi_cache_key/schema.dhall

let fastcgi_cache_lock =
      ../../ngx_http_fastcgi_module/fastcgi_cache_lock/schema.dhall

let fastcgi_cache_lock_age =
      ../../ngx_http_fastcgi_module/fastcgi_cache_lock_age/schema.dhall

let fastcgi_cache_lock_timeout =
      ../../ngx_http_fastcgi_module/fastcgi_cache_lock_timeout/schema.dhall

let fastcgi_cache_max_range_offset =
      ../../ngx_http_fastcgi_module/fastcgi_cache_max_range_offset/schema.dhall

let fastcgi_cache_min_uses =
      ../../ngx_http_fastcgi_module/fastcgi_cache_min_uses/schema.dhall

let fastcgi_cache_revalidate =
      ../../ngx_http_fastcgi_module/fastcgi_cache_revalidate/schema.dhall

let fastcgi_catch_stderr =
      ../../ngx_http_fastcgi_module/fastcgi_catch_stderr/schema.dhall

let fastcgi_connect_timeout =
      ../../ngx_http_fastcgi_module/fastcgi_connect_timeout/schema.dhall

let fastcgi_force_ranges =
      ../../ngx_http_fastcgi_module/fastcgi_force_ranges/schema.dhall

let fastcgi_hide_header =
      ../../ngx_http_fastcgi_module/fastcgi_hide_header/schema.dhall

let fastcgi_ignore_client_abort =
      ../../ngx_http_fastcgi_module/fastcgi_ignore_client_abort/schema.dhall

let fastcgi_index = ../../ngx_http_fastcgi_module/fastcgi_index/schema.dhall

let fastcgi_intercept_errors =
      ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/schema.dhall

let fastcgi_keep_conn =
      ../../ngx_http_fastcgi_module/fastcgi_keep_conn/schema.dhall

let fastcgi_limit_rate =
      ../../ngx_http_fastcgi_module/fastcgi_limit_rate/schema.dhall

let fastcgi_next_upstream_timeout =
      ../../ngx_http_fastcgi_module/fastcgi_next_upstream_timeout/schema.dhall

let fastcgi_next_upstream_tries =
      ../../ngx_http_fastcgi_module/fastcgi_next_upstream_tries/schema.dhall

let fastcgi_param = ../../ngx_http_fastcgi_module/fastcgi_param/schema.dhall

let fastcgi_pass_header =
      ../../ngx_http_fastcgi_module/fastcgi_pass_header/schema.dhall

let fastcgi_pass_request_body =
      ../../ngx_http_fastcgi_module/fastcgi_pass_request_body/schema.dhall

let fastcgi_read_timeout =
      ../../ngx_http_fastcgi_module/fastcgi_read_timeout/schema.dhall

let fastcgi_request_buffering =
      ../../ngx_http_fastcgi_module/fastcgi_request_buffering/schema.dhall

let fastcgi_send_timeout =
      ../../ngx_http_fastcgi_module/fastcgi_send_timeout/schema.dhall

let fastcgi_socket_keepalive =
      ../../ngx_http_fastcgi_module/fastcgi_socket_keepalive/schema.dhall

let if_modified_since = ../if_modified_since/schema.dhall

let ignore_invalid_headers = ../ignore_invalid_headers/schema.dhall

let index = ../../ngx_http_index_module/index/schema.dhall

let keepalive_requests = ../keepalive_requests/schema.dhall

let keepalive_time = ../keepalive_time/schema.dhall

let limit_rate_after = ../limit_rate_after/schema.dhall

let lingering_time = ../lingering_time/schema.dhall

let lingering_timeout = ../lingering_timeout/schema.dhall

let log_format = ../../ngx_http_log_module/log_format/schema.dhall

let log_not_found = ../log_not_found/schema.dhall

let map = ../../ngx_http_map_module/map/schema.dhall

let merge_slashes = ../merge_slashes/schema.dhall

let msie_refresh = ../msie_refresh/schema.dhall

let open_file_cache_errors = ../open_file_cache_errors/schema.dhall

let open_file_cache_min_uses = ../open_file_cache_min_uses/schema.dhall

let open_file_cache_valid = ../open_file_cache_valid/schema.dhall

let port_in_redirect = ../port_in_redirect/schema.dhall

let postpone_output = ../postpone_output/schema.dhall

let recursive_error_pages = ../recursive_error_pages/schema.dhall

let request_pool_size = ../request_pool_size/schema.dhall

let reset_timedout_connection = ../reset_timedout_connection/schema.dhall

let resolver_timeout = ../resolver_timeout/schema.dhall

let rewrite_log = ../../ngx_http_rewrite_module/rewrite_log/schema.dhall

let satisfy = ../satisfy/schema.dhall

let send_lowat = ../send_lowat/schema.dhall

let send_timeout = ../send_timeout/schema.dhall

let sendfile = ../sendfile/schema.dhall

let sendfile_max_chunk = ../sendfile_max_chunk/schema.dhall

let server = ../server/schema.dhall

let server_name_in_redirect = ../server_name_in_redirect/schema.dhall

let server_names_hash_bucket_size =
      ../server_names_hash_bucket_size/schema.dhall

let server_names_hash_max_size = ../server_names_hash_max_size/schema.dhall

let subrequest_output_buffer_size =
      ../subrequest_output_buffer_size/schema.dhall

let tcp_nopush = ../tcp_nopush/schema.dhall

let types = ../types/schema.dhall

let types_hash_bucket_size = ../types_hash_bucket_size/schema.dhall

let types_hash_max_size = ../types_hash_max_size/schema.dhall

let underscores_in_headers = ../underscores_in_headers/schema.dhall

let uninitialized_variable_warn =
      ../../ngx_http_rewrite_module/uninitialized_variable_warn/schema.dhall

let upstream = ../../ngx_http_upstream_module/upstream/schema.dhall

let variables_hash_bucket_size = ../variables_hash_bucket_size/schema.dhall

let variables_hash_max_size = ../variables_hash_max_size/schema.dhall

let default = ./default.dhall

let type = ./type.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let absolute_redirect =
              absolute_redirect.opt c.absolute_redirect (n + 2)

        let access_log = access_log.opt c.access_log (n + 2)

        let access_rules = access_rule.listOpt c.access_rules (n + 2)

        let add_header = add_header.listOpt c.add_header (n + 2)

        let add_trailer = add_trailer.listOpt c.add_trailer (n + 2)

        let aio_write = aio_write.opt c.aio_write (n + 2)

        let auth_basic = auth_basic.opt c.auth_basic (n + 2)

        let auth_basic_user_file =
              auth_basic_user_file.opt c.auth_basic_user_file (n + 2)

        let auth_delay = auth_delay.opt c.auth_delay (n + 2)

        let autoindex = autoindex.opt c.autoindex (n + 2)

        let autoindex_exact_size =
              autoindex_exact_size.opt c.autoindex_exact_size (n + 2)

        let autoindex_format = autoindex_format.opt c.autoindex_format (n + 2)

        let autoindex_localtime =
              autoindex_localtime.opt c.autoindex_localtime (n + 2)

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

        let client_header_buffer_size =
              client_header_buffer_size.opt c.client_header_buffer_size (n + 2)

        let client_max_body_size =
              client_max_body_size.opt c.client_max_body_size (n + 2)

        let connection_pool_size =
              connection_pool_size.opt c.connection_pool_size (n + 2)

        let default_type = default_type.opt c.default_type (n + 2)

        let directio = directio.opt c.directio (n + 2)

        let directio_alignment =
              directio_alignment.opt c.directio_alignment (n + 2)

        let expires = expires.opt c.expires (n + 2)

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

        let fastcgi_params = fastcgi_param.listOpt c.fastcgi_param (n + 2)

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

        let if_modified_since =
              if_modified_since.opt c.if_modified_since (n + 2)

        let ignore_invalid_headers =
              ignore_invalid_headers.opt c.ignore_invalid_headers (n + 2)

        let index = index.opt c.index (n + 2)

        let keepalive_requests =
              keepalive_requests.opt c.keepalive_requests (n + 2)

        let keepalive_time = keepalive_time.opt c.keepalive_time (n + 2)

        let limit_rate_after = limit_rate_after.opt c.limit_rate_after (n + 2)

        let lingering_time = lingering_time.opt c.lingering_time (n + 2)

        let lingering_timeout =
              lingering_timeout.opt c.lingering_timeout (n + 2)

        let log_formats = log_format.listOpt c.log_format (n + 2)

        let log_not_found = log_not_found.opt c.log_not_found (n + 2)

        let map = map.listOpt c.map (n + 2)

        let merge_slashes = merge_slashes.opt c.merge_slashes (n + 2)

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

        let request_pool_size =
              request_pool_size.opt c.request_pool_size (n + 2)

        let reset_timedout_connection =
              reset_timedout_connection.opt c.reset_timedout_connection (n + 2)

        let resolver_timeout = resolver_timeout.opt c.resolver_timeout (n + 2)

        let rewrite_log = rewrite_log.opt c.rewrite_log (n + 2)

        let satisfy = satisfy.opt c.satisfy (n + 2)

        let send_lowat = send_lowat.opt c.send_lowat (n + 2)

        let send_timeout = send_timeout.opt c.send_timeout (n + 2)

        let sendfile = sendfile.opt c.sendfile (n + 2)

        let sendfile_max_chunk =
              sendfile_max_chunk.opt c.sendfile_max_chunk (n + 2)

        let server = server.listOpt c.server (n + 2)

        let server_name_in_redirect =
              server_name_in_redirect.opt c.server_name_in_redirect (n + 2)

        let server_names_hash_bucket_size =
              server_names_hash_bucket_size.opt
                c.server_names_hash_bucket_size
                (n + 2)

        let server_names_hash_max_size =
              server_names_hash_max_size.opt
                c.server_names_hash_max_size
                (n + 2)

        let subrequest_output_buffer_size =
              subrequest_output_buffer_size.opt
                c.subrequest_output_buffer_size
                (n + 2)

        let tcp_nopush = tcp_nopush.opt c.tcp_nopush (n + 2)

        let types = types.opt c.types (n + 2)

        let types_hash_bucket_size =
              types_hash_bucket_size.opt c.types_hash_bucket_size (n + 2)

        let types_hash_max_size =
              types_hash_max_size.opt c.types_hash_max_size (n + 2)

        let underscores_in_headers =
              underscores_in_headers.opt c.underscores_in_headers (n + 2)

        let uninitialized_variable_warn =
              uninitialized_variable_warn.opt
                c.uninitialized_variable_warn
                (n + 2)

        let upstream = upstream.listOpt c.upstream (n + 2)

        let variables_hash_bucket_size =
              variables_hash_bucket_size.opt
                c.variables_hash_bucket_size
                (n + 2)

        let variables_hash_max_size =
              variables_hash_max_size.opt c.variables_hash_max_size (n + 2)

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
                , client_header_buffer_size
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
                , limit_rate_after
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
                , postpone_output
                , recursive_error_pages
                , request_pool_size
                , reset_timedout_connection
                , resolver_timeout
                , rewrite_log
                , satisfy
                , send_lowat
                , send_timeout
                , sendfile
                , sendfile_max_chunk
                , server
                , server_name_in_redirect
                , server_names_hash_bucket_size
                , server_names_hash_max_size
                , subrequest_output_buffer_size
                , tcp_nopush
                , types
                , types_hash_bucket_size
                , types_hash_max_size
                , underscores_in_headers
                , uninitialized_variable_warn
                , upstream
                , variables_hash_bucket_size
                , variables_hash_max_size
                ]

        in  Text/concatSep
              "\n"
              [ indent n "http {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  directives.makeDirective type make ⫽ { default }
