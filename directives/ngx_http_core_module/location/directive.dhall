let Prelude = ../../../Prelude.dhall

let List/unpackOptionals = Prelude.List.unpackOptionals

let Text/concatSep = Prelude.Text.concatSep

let directives = ../../../utils/directives.dhall

let absolute_redirect = ../absolute_redirect/directive.dhall

let access_log = ../../ngx_http_log_module/access_log/directive.dhall

let access_rule = ../../ngx_http_access_module/access_rule/directive.dhall

let add_header = ../../ngx_http_headers_module/add_header/directive.dhall

let add_trailer = ../../ngx_http_headers_module/add_trailer/directive.dhall

let aio = ../aio/directive.dhall

let aio_write = ../aio_write/directive.dhall

let alias = ../alias/directive.dhall

let auth_basic = ../../ngx_http_auth_basic_module/auth_basic/directive.dhall

let auth_basic_user_file =
      ../../ngx_http_auth_basic_module/auth_basic_user_file/directive.dhall

let auth_delay = ../auth_delay/directive.dhall

let autoindex = ../../ngx_http_autoindex_module/autoindex/directive.dhall

let autoindex_exact_size =
      ../../ngx_http_autoindex_module/autoindex_exact_size/directive.dhall

let autoindex_format =
      ../../ngx_http_autoindex_module/autoindex_format/directive.dhall

let autoindex_localtime =
      ../../ngx_http_autoindex_module/autoindex_localtime/directive.dhall

let chunked_transfer_encoding = ../chunked_transfer_encoding/directive.dhall

let client_body_buffer_size = ../client_body_buffer_size/directive.dhall

let client_body_in_single_buffer =
      ../client_body_in_single_buffer/directive.dhall

let client_body_temp_path = ../client_body_temp_path/directive.dhall

let client_body_timeout = ../client_body_timeout/directive.dhall

let client_max_body_size = ../client_max_body_size/directive.dhall

let connection_pool_size = ../connection_pool_size/directive.dhall

let default_type = ../default_type/directive.dhall

let directio = ../directio/directive.dhall

let directio_alignment = ../directio_alignment/directive.dhall

let error_page = ../error_page/directive.dhall

let expires = ../../ngx_http_headers_module/expires/directive.dhall

let fastcgi_buffering =
      ../../ngx_http_fastcgi_module/fastcgi_buffering/directive.dhall

let fastcgi_cache_background_update =
      ../../ngx_http_fastcgi_module/fastcgi_cache_background_update/directive.dhall

let fastcgi_cache_key =
      ../../ngx_http_fastcgi_module/fastcgi_cache_key/directive.dhall

let fastcgi_cache_lock =
      ../../ngx_http_fastcgi_module/fastcgi_cache_lock/directive.dhall

let fastcgi_cache_max_range_offset =
      ../../ngx_http_fastcgi_module/fastcgi_cache_max_range_offset/directive.dhall

let fastcgi_cache_min_uses =
      ../../ngx_http_fastcgi_module/fastcgi_cache_min_uses/directive.dhall

let fastcgi_cache_revalidate =
      ../../ngx_http_fastcgi_module/fastcgi_cache_revalidate/directive.dhall

let fastcgi_catch_stderr =
      ../../ngx_http_fastcgi_module/fastcgi_catch_stderr/directive.dhall

let fastcgi_force_ranges =
      ../../ngx_http_fastcgi_module/fastcgi_force_ranges/directive.dhall

let fastcgi_hide_header =
      ../../ngx_http_fastcgi_module/fastcgi_hide_header/directive.dhall

let fastcgi_ignore_client_abort =
      ../../ngx_http_fastcgi_module/fastcgi_ignore_client_abort/directive.dhall

let fastcgi_index = ../../ngx_http_fastcgi_module/fastcgi_index/directive.dhall

let fastcgi_intercept_errors =
      ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/directive.dhall

let fastcgi_keep_conn =
      ../../ngx_http_fastcgi_module/fastcgi_keep_conn/directive.dhall

let fastcgi_limit_rate =
      ../../ngx_http_fastcgi_module/fastcgi_limit_rate/directive.dhall

let fastcgi_max_temp_file_size =
      ../../ngx_http_fastcgi_module/fastcgi_max_temp_file_size/directive.dhall

let fastcgi_next_upstream_tries =
      ../../ngx_http_fastcgi_module/fastcgi_next_upstream_tries/directive.dhall

let fastcgi_param = ../../ngx_http_fastcgi_module/fastcgi_param/directive.dhall

let fastcgi_pass = ../../ngx_http_fastcgi_module/fastcgi_pass/directive.dhall

let fastcgi_pass_header =
      ../../ngx_http_fastcgi_module/fastcgi_pass_header/directive.dhall

let fastcgi_pass_request_body =
      ../../ngx_http_fastcgi_module/fastcgi_pass_request_body/directive.dhall

let fastcgi_request_buffering =
      ../../ngx_http_fastcgi_module/fastcgi_request_buffering/directive.dhall

let fastcgi_send_lowat =
      ../../ngx_http_fastcgi_module/fastcgi_send_lowat/directive.dhall

let fastcgi_socket_keepalive =
      ../../ngx_http_fastcgi_module/fastcgi_socket_keepalive/directive.dhall

let fastcgi_store = ../../ngx_http_fastcgi_module/fastcgi_store/directive.dhall

let fastcgi_store_access =
      ../../ngx_http_fastcgi_module/fastcgi_store_access/directive.dhall

let fastcgi_temp_file_write_size =
      ../../ngx_http_fastcgi_module/fastcgi_temp_file_write_size/directive.dhall

let fastcgi_temp_path =
      ../../ngx_http_fastcgi_module/fastcgi_temp_path/directive.dhall

let gzip = ../../ngx_http_gzip_module/gzip/directive.dhall

let gzip_min_length = ../../ngx_http_gzip_module/gzip_min_length/directive.dhall

let gzip_types = ../../ngx_http_gzip_module/gzip_types/directive.dhall

let gzip_vary = ../../ngx_http_gzip_module/gzip_vary/directive.dhall

let indent = ../../../utils/indent.dhall

let index = ../../ngx_http_index_module/index/directive.dhall

let internal = ../internal/directive.dhall

let keepalive_requests = ../keepalive_requests/directive.dhall

let keepalive_time = ../keepalive_time/directive.dhall

let keepalive_timeout = ../keepalive_timeout/directive.dhall

let limit_rate = ../limit_rate/directive.dhall

let limit_rate_after = ../limit_rate_after/directive.dhall

let lingering_close = ../lingering_close/directive.dhall

let lingering_time = ../lingering_time/directive.dhall

let lingering_timeout = ../lingering_timeout/directive.dhall

let log_not_found = ../log_not_found/directive.dhall

let log_subrequest = ../log_subrequest/directive.dhall

let max_ranges = ../max_ranges/directive.dhall

let modifier = ./modifier.dhall

let msie_padding = ../msie_padding/directive.dhall

let msie_refresh = ../msie_refresh/directive.dhall

let open_file_cache_errors = ../open_file_cache_errors/directive.dhall

let open_file_cache_min_uses = ../open_file_cache_min_uses/directive.dhall

let open_file_cache_valid = ../open_file_cache_valid/directive.dhall

let port_in_redirect = ../port_in_redirect/directive.dhall

let postpone_output = ../postpone_output/directive.dhall

let proxy_buffering =
      ../../ngx_http_proxy_module/proxy_buffering/directive.dhall

let proxy_buffers = ../../ngx_http_proxy_module/proxy_buffers/directive.dhall

let proxy_cache = ../../ngx_http_proxy_module/proxy_cache/directive.dhall

let proxy_connect_timeout =
      ../../ngx_http_proxy_module/proxy_connect_timeout/directive.dhall

let proxy_pass = ../../ngx_http_proxy_module/proxy_pass/directive.dhall

let proxy_read_timeout =
      ../../ngx_http_proxy_module/proxy_read_timeout/directive.dhall

let proxy_redirect = ../../ngx_http_proxy_module/proxy_redirect/directive.dhall

let proxy_send_timeout =
      ../../ngx_http_proxy_module/proxy_send_timeout/directive.dhall

let proxy_set_header =
      ../../ngx_http_proxy_module/proxy_set_header/directive.dhall

let proxy_temp_path =
      ../../ngx_http_proxy_module/proxy_temp_path/directive.dhall

let read_ahead = ../read_ahead/directive.dhall

let recursive_error_pages = ../recursive_error_pages/directive.dhall

let reset_timedout_connection = ../reset_timedout_connection/directive.dhall

let resolver_timeout = ../resolver_timeout/directive.dhall

let rewrite = ../../ngx_http_rewrite_module/rewrite/directive.dhall

let rewrite_log = ../../ngx_http_rewrite_module/rewrite_log/directive.dhall

let root = ../root/directive.dhall

let satisfy = ../satisfy/directive.dhall

let send_lowat = ../send_lowat/directive.dhall

let send_timeout = ../send_timeout/directive.dhall

let sendfile_max_chunk = ../sendfile_max_chunk/directive.dhall

let server_name_in_redirect = ../server_name_in_redirect/directive.dhall

let server_tokens = ../server_tokens/directive.dhall

let subrequest_output_buffer_size =
      ../subrequest_output_buffer_size/directive.dhall

let tcp_nopush = ../tcp_nopush/directive.dhall

let try_files = ../try_files/directive.dhall

let types_hash_bucket_size = ../types_hash_bucket_size/directive.dhall

let types_hash_max_size = ../types_hash_max_size/directive.dhall

let uninitialized_variable_warn =
      ../../ngx_http_rewrite_module/uninitialized_variable_warn/directive.dhall

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

        let aio = aio.opt c.aio (n + 2)

        let aio_write = aio_write.opt c.aio_write (n + 2)

        let alias = alias.opt c.alias (n + 2)

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

        let client_body_temp_path =
              client_body_temp_path.opt c.client_body_temp_path (n + 2)

        let client_body_timeout =
              client_body_timeout.opt c.client_body_timeout (n + 2)

        let client_max_body_size =
              client_max_body_size.opt c.client_max_body_size (n + 2)

        let connection_pool_size =
              connection_pool_size.opt c.connection_pool_size (n + 2)

        let default_type = default_type.opt c.default_type (n + 2)

        let directio = directio.opt c.directio (n + 2)

        let directio_alignment =
              directio_alignment.opt c.directio_alignment (n + 2)

        let error_page = error_page.listOpt c.error_page (n + 2)

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

        let fastcgi_max_temp_file_size =
              fastcgi_max_temp_file_size.opt
                c.fastcgi_max_temp_file_size
                (n + 2)

        let fastcgi_next_upstream_tries =
              fastcgi_next_upstream_tries.opt
                c.fastcgi_next_upstream_tries
                (n + 2)

        let fastcgi_params = fastcgi_param.listOpt c.fastcgi_param (n + 2)

        let fastcgi_pass = fastcgi_pass.opt c.fastcgi_pass (n + 2)

        let fastcgi_pass_header =
              fastcgi_pass_header.opt c.fastcgi_pass_header (n + 2)

        let fastcgi_pass_request_body =
              fastcgi_pass_request_body.opt c.fastcgi_pass_request_body (n + 2)

        let fastcgi_request_buffering =
              fastcgi_request_buffering.opt c.fastcgi_request_buffering (n + 2)

        let fastcgi_send_lowat =
              fastcgi_send_lowat.opt c.fastcgi_send_lowat (n + 2)

        let fastcgi_socket_keepalive =
              fastcgi_socket_keepalive.opt c.fastcgi_socket_keepalive (n + 2)

        let fastcgi_store = fastcgi_store.opt c.fastcgi_store (n + 2)

        let fastcgi_store_access =
              fastcgi_store_access.opt c.fastcgi_store_access (n + 2)

        let fastcgi_temp_file_write_size =
              fastcgi_temp_file_write_size.opt
                c.fastcgi_temp_file_write_size
                (n + 2)

        let fastcgi_temp_path =
              fastcgi_temp_path.opt c.fastcgi_temp_path (n + 2)

        let gzip = gzip.opt c.gzip (n + 2)

        let gzip_min_length = gzip_min_length.opt c.gzip_min_length (n + 2)

        let gzip_types =
              if    Natural/isZero (List/length Text c.gzip_types)
              then  None Text
              else  Some (gzip_types.make (n + 2) c.gzip_types)

        let gzip_vary = gzip_vary.opt c.gzip_vary (n + 2)

        let index = index.opt c.index (n + 2)

        let internal = internal.opt c.internal (n + 2)

        let keepalive_requests =
              keepalive_requests.opt c.keepalive_requests (n + 2)

        let keepalive_time = keepalive_time.opt c.keepalive_time (n + 2)

        let keepalive_timeout =
              keepalive_timeout.opt c.keepalive_timeout (n + 2)

        let limit_rate = limit_rate.opt c.limit_rate (n + 2)

        let limit_rate_after = limit_rate_after.opt c.limit_rate_after (n + 2)

        let lingering_close = lingering_close.opt c.lingering_close (n + 2)

        let lingering_time = lingering_time.opt c.lingering_time (n + 2)

        let lingering_timeout =
              lingering_timeout.opt c.lingering_timeout (n + 2)

        let log_not_found = log_not_found.opt c.log_not_found (n + 2)

        let log_subrequest = log_subrequest.opt c.log_subrequest (n + 2)

        let max_ranges = max_ranges.opt c.max_ranges (n + 2)

        let msie_padding = msie_padding.opt c.msie_padding (n + 2)

        let msie_refresh = msie_refresh.opt c.msie_refresh (n + 2)

        let open_file_cache_errors =
              open_file_cache_errors.opt c.open_file_cache_errors (n + 2)

        let open_file_cache_min_uses =
              open_file_cache_min_uses.opt c.open_file_cache_min_uses (n + 2)

        let open_file_cache_valid =
              open_file_cache_valid.opt c.open_file_cache_valid (n + 2)

        let port_in_redirect = port_in_redirect.opt c.port_in_redirect (n + 2)

        let postpone_output = postpone_output.opt c.postpone_output (n + 2)

        let proxy_buffering = proxy_buffering.opt c.proxy_buffering (n + 2)

        let proxy_buffers = proxy_buffers.opt c.proxy_buffers (n + 2)

        let proxy_cache = proxy_cache.opt c.proxy_cache (n + 2)

        let proxy_connect_timeout =
              proxy_connect_timeout.opt c.proxy_connect_timeout (n + 2)

        let proxy_pass = proxy_pass.opt c.proxy_pass (n + 2)

        let proxy_read_timeout =
              proxy_read_timeout.opt c.proxy_read_timeout (n + 2)

        let proxy_redirect = proxy_redirect.opt c.proxy_redirect (n + 2)

        let proxy_send_timeout =
              proxy_send_timeout.opt c.proxy_send_timeout (n + 2)

        let proxy_set_header = proxy_set_header.opt c.proxy_set_header (n + 2)

        let proxy_temp_path = proxy_temp_path.opt c.proxy_temp_path (n + 2)

        let read_ahead = read_ahead.opt c.read_ahead (n + 2)

        let recursive_error_pages =
              recursive_error_pages.opt c.recursive_error_pages (n + 2)

        let reset_timedout_connection =
              reset_timedout_connection.opt c.reset_timedout_connection (n + 2)

        let resolver_timeout = resolver_timeout.opt c.resolver_timeout (n + 2)

        let rewrite = rewrite.opt c.rewrite (n + 2)

        let rewrite_log = rewrite_log.opt c.rewrite_log (n + 2)

        let root = root.opt c.root (n + 2)

        let satisfy = satisfy.opt c.satisfy (n + 2)

        let send_lowat = send_lowat.opt c.send_lowat (n + 2)

        let send_timeout = send_timeout.opt c.send_timeout (n + 2)

        let sendfile_max_chunk =
              sendfile_max_chunk.opt c.sendfile_max_chunk (n + 2)

        let server_name_in_redirect =
              server_name_in_redirect.opt c.server_name_in_redirect (n + 2)

        let server_tokens = server_tokens.opt c.server_tokens (n + 2)

        let subrequest_output_buffer_size =
              subrequest_output_buffer_size.opt
                c.subrequest_output_buffer_size
                (n + 2)

        let tcp_nopush = tcp_nopush.opt c.tcp_nopush (n + 2)

        let try_files = try_files.opt c.try_files (n + 2)

        let types_hash_bucket_size =
              types_hash_bucket_size.opt c.types_hash_bucket_size (n + 2)

        let types_hash_max_size =
              types_hash_max_size.opt c.types_hash_max_size (n + 2)

        let uninitialized_variable_warn =
              uninitialized_variable_warn.opt
                c.uninitialized_variable_warn
                (n + 2)

        let directives =
              List/unpackOptionals
                Text
                [ absolute_redirect
                , access_log
                , access_rules
                , add_header
                , add_trailer
                , aio
                , aio_write
                , alias
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
                , client_body_temp_path
                , client_body_timeout
                , client_max_body_size
                , connection_pool_size
                , default_type
                , directio
                , directio_alignment
                , error_page
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
                , fastcgi_max_temp_file_size
                , fastcgi_next_upstream_tries
                , fastcgi_params
                , fastcgi_pass
                , fastcgi_pass_header
                , fastcgi_pass_request_body
                , fastcgi_request_buffering
                , fastcgi_send_lowat
                , fastcgi_socket_keepalive
                , fastcgi_store
                , fastcgi_store_access
                , fastcgi_temp_file_write_size
                , fastcgi_temp_path
                , gzip
                , gzip_min_length
                , gzip_types
                , gzip_vary
                , index
                , internal
                , keepalive_requests
                , keepalive_time
                , keepalive_timeout
                , limit_rate
                , limit_rate_after
                , lingering_close
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
                , proxy_buffering
                , proxy_buffers
                , proxy_cache
                , proxy_connect_timeout
                , proxy_pass
                , proxy_read_timeout
                , proxy_redirect
                , proxy_send_timeout
                , proxy_set_header
                , proxy_temp_path
                , read_ahead
                , recursive_error_pages
                , reset_timedout_connection
                , resolver_timeout
                , rewrite
                , rewrite_log
                , root
                , satisfy
                , satisfy
                , send_lowat
                , send_timeout
                , sendfile_max_chunk
                , server_name_in_redirect
                , server_tokens
                , subrequest_output_buffer_size
                , tcp_nopush
                , try_files
                , types_hash_bucket_size
                , types_hash_max_size
                , uninitialized_variable_warn
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

in  directives.makeDirective type make ⫽ { default, modifier }
