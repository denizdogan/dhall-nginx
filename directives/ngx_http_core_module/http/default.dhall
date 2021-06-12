let ngx_http_fastcgi_module = ../../ngx_http_fastcgi_module/package.dhall

in  { absolute_redirect = None ../absolute_redirect/type.dhall
    , access_log = None ../../ngx_http_log_module/access_log/type.dhall
    , access_rules =
        [] : List ../../ngx_http_access_module/access_rule/type.dhall
    , add_header = [] : List ../../ngx_http_headers_module/add_header/type.dhall
    , add_trailer =
        [] : List ../../ngx_http_headers_module/add_trailer/type.dhall
    , aio = None ../aio/type.dhall
    , aio_write = None ../aio_write/type.dhall
    , auth_basic = None ../../ngx_http_auth_basic_module/auth_basic/type.dhall
    , auth_basic_user_file =
        None ../../ngx_http_auth_basic_module/auth_basic_user_file/type.dhall
    , auth_delay = None ../auth_delay/type.dhall
    , autoindex = None ../../ngx_http_autoindex_module/autoindex/type.dhall
    , autoindex_exact_size =
        None ../../ngx_http_autoindex_module/autoindex_exact_size/type.dhall
    , autoindex_format =
        None ../../ngx_http_autoindex_module/autoindex_format/type.dhall
    , autoindex_localtime =
        None ../../ngx_http_autoindex_module/autoindex_localtime/type.dhall
    , chunked_transfer_encoding = None ../chunked_transfer_encoding/type.dhall
    , client_body_buffer_size = None ../client_body_buffer_size/type.dhall
    , client_header_buffer_size = None ../client_header_buffer_size/type.dhall
    , client_max_body_size = None ../client_max_body_size/type.dhall
    , client_body_in_single_buffer =
        None ../client_body_in_single_buffer/type.dhall
    , client_body_timeout = None ../client_body_timeout/type.dhall
    , connection_pool_size = None ../connection_pool_size/type.dhall
    , default_type = None ../default_type/type.dhall
    , directio = None ../directio/type.dhall
    , directio_alignment = None ../directio_alignment/type.dhall
    , error_page = None ../error_page/type.dhall
    , expires = None ../../ngx_http_headers_module/expires/type.dhall
    , fastcgi_buffering = None ngx_http_fastcgi_module.fastcgi_buffering.Type
    , fastcgi_cache_background_update =
        None ngx_http_fastcgi_module.fastcgi_cache_background_update.Type
    , fastcgi_cache_key = None ngx_http_fastcgi_module.fastcgi_cache_key.Type
    , fastcgi_cache_lock = None ngx_http_fastcgi_module.fastcgi_cache_lock.Type
    , fastcgi_cache_lock_age =
        None ngx_http_fastcgi_module.fastcgi_cache_lock_age.Type
    , fastcgi_cache_lock_timeout =
        None ngx_http_fastcgi_module.fastcgi_cache_lock_timeout.Type
    , fastcgi_cache_max_range_offset =
        None ngx_http_fastcgi_module.fastcgi_cache_max_range_offset.Type
    , fastcgi_cache_min_uses =
        None ngx_http_fastcgi_module.fastcgi_cache_min_uses.Type
    , fastcgi_cache_revalidate =
        None ngx_http_fastcgi_module.fastcgi_cache_revalidate.Type
    , fastcgi_catch_stderr =
        None ngx_http_fastcgi_module.fastcgi_catch_stderr.Type
    , fastcgi_connect_timeout =
        None ngx_http_fastcgi_module.fastcgi_connect_timeout.Type
    , fastcgi_force_ranges =
        None ngx_http_fastcgi_module.fastcgi_force_ranges.Type
    , fastcgi_hide_header =
        None ngx_http_fastcgi_module.fastcgi_hide_header.Type
    , fastcgi_ignore_client_abort =
        None ngx_http_fastcgi_module.fastcgi_ignore_client_abort.Type
    , fastcgi_index = None ngx_http_fastcgi_module.fastcgi_index.Type
    , fastcgi_intercept_errors =
        None ngx_http_fastcgi_module.fastcgi_intercept_errors.Type
    , fastcgi_keep_conn = None ngx_http_fastcgi_module.fastcgi_keep_conn.Type
    , fastcgi_limit_rate = None ngx_http_fastcgi_module.fastcgi_limit_rate.Type
    , fastcgi_next_upstream_timeout =
        None ngx_http_fastcgi_module.fastcgi_next_upstream_timeout.Type
    , fastcgi_next_upstream_tries =
        None ngx_http_fastcgi_module.fastcgi_next_upstream_tries.Type
    , fastcgi_param =
        [] : List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
    , fastcgi_pass_header =
        None ngx_http_fastcgi_module.fastcgi_pass_header.Type
    , fastcgi_pass_request_body =
        None ngx_http_fastcgi_module.fastcgi_pass_request_body.Type
    , fastcgi_pass_request_headers =
        None ngx_http_fastcgi_module.fastcgi_pass_request_headers.Type
    , fastcgi_read_timeout =
        None ngx_http_fastcgi_module.fastcgi_read_timeout.Type
    , fastcgi_request_buffering =
        None ngx_http_fastcgi_module.fastcgi_request_buffering.Type
    , fastcgi_send_timeout =
        None ngx_http_fastcgi_module.fastcgi_send_timeout.Type
    , fastcgi_socket_keepalive =
        None ngx_http_fastcgi_module.fastcgi_socket_keepalive.Type
    , gzip = None ../../ngx_http_gzip_module/gzip/type.dhall
    , gzip_types = [] : ../../ngx_http_gzip_module/gzip_types/type.dhall
    , if_modified_since = None ../if_modified_since/type.dhall
    , ignore_invalid_headers = None ../ignore_invalid_headers/type.dhall
    , index = None ../../ngx_http_index_module/index/type.dhall
    , keepalive_requests = None ../keepalive_requests/type.dhall
    , keepalive_time = None ../keepalive_time/type.dhall
    , keepalive_timeout = None ../keepalive_timeout/type.dhall
    , limit_rate_after = None ../limit_rate_after/type.dhall
    , lingering_time = None ../lingering_time/type.dhall
    , lingering_timeout = None ../lingering_timeout/type.dhall
    , log_format = [] : List ../../ngx_http_log_module/log_format/type.dhall
    , log_not_found = None ../log_not_found/type.dhall
    , map = [] : List ../../ngx_http_map_module/map/type.dhall
    , merge_slashes = None ../merge_slashes/type.dhall
    , msie_refresh = None ../msie_refresh/type.dhall
    , open_file_cache_errors = None ../open_file_cache_errors/type.dhall
    , open_file_cache_min_uses = None ../open_file_cache_min_uses/type.dhall
    , open_file_cache_valid = None ../open_file_cache_valid/type.dhall
    , port_in_redirect = None ../port_in_redirect/type.dhall
    , postpone_output = None ../postpone_output/type.dhall
    , proxy_buffers = None ../../ngx_http_proxy_module/proxy_buffers/type.dhall
    , proxy_connect_timeout =
        None ../../ngx_http_proxy_module/proxy_connect_timeout/type.dhall
    , proxy_read_timeout =
        None ../../ngx_http_proxy_module/proxy_read_timeout/type.dhall
    , proxy_redirect =
        None ../../ngx_http_proxy_module/proxy_redirect/type.dhall
    , proxy_send_timeout =
        None ../../ngx_http_proxy_module/proxy_send_timeout/type.dhall
    , proxy_set_header =
        [] : ../../ngx_http_proxy_module/proxy_set_header/type.dhall
    , recursive_error_pages = None ../recursive_error_pages/type.dhall
    , request_pool_size = None ../request_pool_size/type.dhall
    , reset_timedout_connection = None ../reset_timedout_connection/type.dhall
    , resolver_timeout = None ../resolver_timeout/type.dhall
    , rewrite_log = None ../../ngx_http_rewrite_module/rewrite_log/type.dhall
    , satisfy = None ../satisfy/type.dhall
    , send_lowat = None ../send_lowat/type.dhall
    , send_timeout = None ../send_timeout/type.dhall
    , sendfile = None ../sendfile/type.dhall
    , sendfile_max_chunk = None ../sendfile_max_chunk/type.dhall
    , server = [] : List ../../ngx_http_core_module/server/type.dhall
    , server_name_in_redirect = None ../server_name_in_redirect/type.dhall
    , server_names_hash_bucket_size =
        None ../server_names_hash_bucket_size/type.dhall
    , server_names_hash_max_size = None ../server_names_hash_max_size/type.dhall
    , ssl = None ../../ngx_http_ssl_module/ssl/type.dhall
    , ssl_buffer_size =
        None ../../ngx_http_ssl_module/ssl_buffer_size/type.dhall
    , ssl_certificate =
        None ../../ngx_http_ssl_module/ssl_certificate/type.dhall
    , ssl_certificate_key =
        None ../../ngx_http_ssl_module/ssl_certificate_key/type.dhall
    , ssl_ciphers = None ../../ngx_http_ssl_module/ssl_ciphers/type.dhall
    , ssl_client_certificate =
        None ../../ngx_http_ssl_module/ssl_client_certificate/type.dhall
    , ssl_conf_command =
        None ../../ngx_http_ssl_module/ssl_conf_command/type.dhall
    , ssl_crl = None ../../ngx_http_ssl_module/ssl_crl/type.dhall
    , ssl_dhparam = None ../../ngx_http_ssl_module/ssl_dhparam/type.dhall
    , ssl_early_data = None ../../ngx_http_ssl_module/ssl_early_data/type.dhall
    , ssl_ecdh_curve = None ../../ngx_http_ssl_module/ssl_ecdh_curve/type.dhall
    , ssl_ocsp = None ../../ngx_http_ssl_module/ssl_ocsp/type.dhall
    , ssl_ocsp_cache = None ../../ngx_http_ssl_module/ssl_ocsp_cache/type.dhall
    , ssl_ocsp_responder =
        None ../../ngx_http_ssl_module/ssl_ocsp_responder/type.dhall
    , ssl_password_file =
        None ../../ngx_http_ssl_module/ssl_password_file/type.dhall
    , ssl_prefer_server_ciphers =
        None ../../ngx_http_ssl_module/ssl_prefer_server_ciphers/type.dhall
    , ssl_protocols = None ../../ngx_http_ssl_module/ssl_protocols/type.dhall
    , ssl_reject_handshake =
        None ../../ngx_http_ssl_module/ssl_reject_handshake/type.dhall
    , ssl_session_cache =
        None ../../ngx_http_ssl_module/ssl_session_cache/type.dhall
    , ssl_session_ticket_key =
        None ../../ngx_http_ssl_module/ssl_session_ticket_key/type.dhall
    , ssl_session_tickets =
        None ../../ngx_http_ssl_module/ssl_session_tickets/type.dhall
    , ssl_session_timeout =
        None ../../ngx_http_ssl_module/ssl_session_timeout/type.dhall
    , ssl_stapling = None ../../ngx_http_ssl_module/ssl_stapling/type.dhall
    , ssl_stapling_file =
        None ../../ngx_http_ssl_module/ssl_stapling_file/type.dhall
    , ssl_stapling_responder =
        None ../../ngx_http_ssl_module/ssl_stapling_responder/type.dhall
    , ssl_stapling_verify =
        None ../../ngx_http_ssl_module/ssl_stapling_verify/type.dhall
    , ssl_trusted_certificate =
        None ../../ngx_http_ssl_module/ssl_trusted_certificate/type.dhall
    , ssl_verify_client =
        None ../../ngx_http_ssl_module/ssl_verify_client/type.dhall
    , ssl_verify_depth =
        None ../../ngx_http_ssl_module/ssl_verify_depth/type.dhall
    , subrequest_output_buffer_size =
        None ../subrequest_output_buffer_size/type.dhall
    , tcp_nopush = None ../tcp_nopush/type.dhall
    , types = None ../types/type.dhall
    , types_hash_bucket_size = None ../types_hash_bucket_size/type.dhall
    , types_hash_max_size = None ../types_hash_max_size/type.dhall
    , underscores_in_headers = None ../underscores_in_headers/type.dhall
    , uninitialized_variable_warn =
        None
          ../../ngx_http_rewrite_module/uninitialized_variable_warn/type.dhall
    , upstream = [] : List ../../ngx_http_upstream_module/upstream/type.dhall
    , variables_hash_bucket_size = None ../variables_hash_bucket_size/type.dhall
    , variables_hash_max_size = None ../variables_hash_max_size/type.dhall
    }
