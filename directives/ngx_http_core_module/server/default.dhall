{ access_rules = [] : List ../../ngx_http_access_module/access_rule/type.dhall
, access_log = None ../../ngx_http_log_module/access_log/type.dhall
, add_header = [] : List ../../ngx_http_headers_module/add_header/type.dhall
, add_trailer = [] : List ../../ngx_http_headers_module/add_trailer/type.dhall
, aio = None ../aio/type.dhall
, aio_write = None ../aio_write/type.dhall
, auth_basic = None ../../ngx_http_auth_basic_module/auth_basic/type.dhall
, auth_basic_user_file =
    None ../../ngx_http_auth_basic_module/auth_basic_user_file/type.dhall
, autoindex = None ../../ngx_http_autoindex_module/autoindex/type.dhall
, autoindex_exact_size =
    None ../../ngx_http_autoindex_module/autoindex_exact_size/type.dhall
, autoindex_format =
    None ../../ngx_http_autoindex_module/autoindex_format/type.dhall
, autoindex_localtime =
    None ../../ngx_http_autoindex_module/autoindex_localtime/type.dhall
, client_body_buffer_size = None ../client_body_buffer_size/type.dhall
, client_body_temp_path = None ../client_body_temp_path/type.dhall
, client_header_buffer_size = None ../client_header_buffer_size/type.dhall
, client_max_body_size = None ../client_max_body_size/type.dhall
, connection_pool_size = None ../connection_pool_size/type.dhall
, default_type = None ../default_type/type.dhall
, directio = None ../directio/type.dhall
, directio_alignment = None ../directio_alignment/type.dhall
, error_page = [] : List ../error_page/type.dhall
, expires = None ../../ngx_http_headers_module/expires/type.dhall
, fastcgi_buffering =
    None ../../ngx_http_fastcgi_module/fastcgi_buffering/type.dhall
, fastcgi_cache_background_update =
    None
      ../../ngx_http_fastcgi_module/fastcgi_cache_background_update/type.dhall
, fastcgi_cache_key =
    None ../../ngx_http_fastcgi_module/fastcgi_cache_key/type.dhall
, fastcgi_cache_lock =
    None ../../ngx_http_fastcgi_module/fastcgi_cache_lock/type.dhall
, fastcgi_cache_max_range_offset =
    None ../../ngx_http_fastcgi_module/fastcgi_cache_max_range_offset/type.dhall
, fastcgi_cache_min_uses =
    None ../../ngx_http_fastcgi_module/fastcgi_cache_min_uses/type.dhall
, fastcgi_cache_revalidate =
    None ../../ngx_http_fastcgi_module/fastcgi_cache_revalidate/type.dhall
, fastcgi_catch_stderr =
    None ../../ngx_http_fastcgi_module/fastcgi_catch_stderr/type.dhall
, fastcgi_force_ranges =
    None ../../ngx_http_fastcgi_module/fastcgi_force_ranges/type.dhall
, fastcgi_hide_header =
    None ../../ngx_http_fastcgi_module/fastcgi_hide_header/type.dhall
, fastcgi_ignore_client_abort =
    None ../../ngx_http_fastcgi_module/fastcgi_ignore_client_abort/type.dhall
, fastcgi_index = None ../../ngx_http_fastcgi_module/fastcgi_index/type.dhall
, fastcgi_intercept_errors =
    None ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/type.dhall
, fastcgi_keep_conn =
    None ../../ngx_http_fastcgi_module/fastcgi_keep_conn/type.dhall
, fastcgi_limit_rate =
    None ../../ngx_http_fastcgi_module/fastcgi_limit_rate/type.dhall
, fastcgi_max_temp_file_size =
    None ../../ngx_http_fastcgi_module/fastcgi_max_temp_file_size/type.dhall
, fastcgi_next_upstream_tries =
    None ../../ngx_http_fastcgi_module/fastcgi_next_upstream_tries/type.dhall
, fastcgi_pass_header =
    None ../../ngx_http_fastcgi_module/fastcgi_pass_header/type.dhall
, fastcgi_pass_request_body =
    None ../../ngx_http_fastcgi_module/fastcgi_pass_request_body/type.dhall
, fastcgi_pass_request_headers =
    None ../../ngx_http_fastcgi_module/fastcgi_pass_request_headers/type.dhall
, fastcgi_request_buffering =
    None ../../ngx_http_fastcgi_module/fastcgi_request_buffering/type.dhall
, fastcgi_socket_keepalive =
    None ../../ngx_http_fastcgi_module/fastcgi_socket_keepalive/type.dhall
, fastcgi_param =
    [] : List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
, fastcgi_send_lowat =
    None ../../ngx_http_fastcgi_module/fastcgi_send_lowat/type.dhall
, fastcgi_store = None ../../ngx_http_fastcgi_module/fastcgi_store/type.dhall
, fastcgi_store_access =
    None ../../ngx_http_fastcgi_module/fastcgi_store_access/type.dhall
, fastcgi_temp_file_write_size =
    None ../../ngx_http_fastcgi_module/fastcgi_temp_file_write_size/type.dhall
, fastcgi_temp_path =
    None ../../ngx_http_fastcgi_module/fastcgi_temp_path/type.dhall
, gzip = None ../../ngx_http_gzip_module/gzip/type.dhall
, gzip_types = [] : ../../ngx_http_gzip_module/gzip_types/type.dhall
, index = None ../../ngx_http_index_module/index/type.dhall
, keepalive_timeout = None ../keepalive_timeout/type.dhall
, lingering_close = None ../lingering_close/type.dhall
, lingering_time = None ../lingering_time/type.dhall
, limit_rate_after = None ../limit_rate_after/type.dhall
, listen = [] : List ../listen/type.dhall
, location = [] : List ../location/type.dhall
, log_not_found = None ../log_not_found/type.dhall
, postpone_output = None ../postpone_output/type.dhall
, proxy_buffers = None ../../ngx_http_proxy_module/proxy_buffers/type.dhall
, proxy_connect_timeout =
    None ../../ngx_http_proxy_module/proxy_connect_timeout/type.dhall
, proxy_read_timeout =
    None ../../ngx_http_proxy_module/proxy_read_timeout/type.dhall
, proxy_redirect = None ../../ngx_http_proxy_module/proxy_redirect/type.dhall
, proxy_send_timeout =
    None ../../ngx_http_proxy_module/proxy_send_timeout/type.dhall
, proxy_set_header =
    [] : ../../ngx_http_proxy_module/proxy_set_header/type.dhall
, proxy_temp_path = None ../../ngx_http_proxy_module/proxy_temp_path/type.dhall
, read_ahead = None ../read_ahead/type.dhall
, request_pool_size = None ../request_pool_size/type.dhall
, rewrite = None ../../ngx_http_rewrite_module/rewrite/type.dhall
, rewrite_log = None ../../ngx_http_rewrite_module/rewrite_log/type.dhall
, root = None ../../ngx_http_core_module/root/type.dhall
, satisfy = None ../satisfy/type.dhall
, send_lowat = None ../send_lowat/type.dhall
, sendfile_max_chunk = None ../sendfile_max_chunk/type.dhall
, server_tokens = None ../server_tokens/type.dhall
, ssl = None ../../ngx_http_ssl_module/ssl/type.dhall
, ssl_buffer_size = None ../../ngx_http_ssl_module/ssl_buffer_size/type.dhall
, ssl_certificate = None ../../ngx_http_ssl_module/ssl_certificate/type.dhall
, ssl_certificate_key =
    None ../../ngx_http_ssl_module/ssl_certificate_key/type.dhall
, ssl_ciphers = None ../../ngx_http_ssl_module/ssl_ciphers/type.dhall
, ssl_client_certificate =
    None ../../ngx_http_ssl_module/ssl_client_certificate/type.dhall
, ssl_conf_command = None ../../ngx_http_ssl_module/ssl_conf_command/type.dhall
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
, ssl_verify_depth = None ../../ngx_http_ssl_module/ssl_verify_depth/type.dhall
, subrequest_output_buffer_size =
    None ../subrequest_output_buffer_size/type.dhall
, tcp_nodelay = None ../tcp_nodelay/type.dhall
, try_files = None ../try_files/type.dhall
, types_hash_bucket_size = None ../types_hash_bucket_size/type.dhall
, types_hash_max_size = None ../types_hash_max_size/type.dhall
, uninitialized_variable_warn =
    None ../../ngx_http_rewrite_module/uninitialized_variable_warn/type.dhall
}
