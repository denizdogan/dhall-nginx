{ absolute_redirect : Optional ../absolute_redirect/type.dhall
, access_log : Optional ../../ngx_http_log_module/access_log/type.dhall
, access_rules : List ../../ngx_http_access_module/access_rule/type.dhall
, add_header : List ../../ngx_http_headers_module/add_header/type.dhall
, add_trailer : List ../../ngx_http_headers_module/add_trailer/type.dhall
, aio : Optional ../aio/type.dhall
, aio_write : Optional ../aio_write/type.dhall
, alias : Optional ../alias/type.dhall
, auth_basic : Optional ../../ngx_http_auth_basic_module/auth_basic/type.dhall
, auth_basic_user_file :
    Optional ../../ngx_http_auth_basic_module/auth_basic_user_file/type.dhall
, auth_delay : Optional ../auth_delay/type.dhall
, autoindex : Optional ../../ngx_http_autoindex_module/autoindex/type.dhall
, autoindex_exact_size :
    Optional ../../ngx_http_autoindex_module/autoindex_exact_size/type.dhall
, autoindex_format :
    Optional ../../ngx_http_autoindex_module/autoindex_format/type.dhall
, autoindex_localtime :
    Optional ../../ngx_http_autoindex_module/autoindex_localtime/type.dhall
, chunked_transfer_encoding : Optional ../chunked_transfer_encoding/type.dhall
, client_body_buffer_size : Optional ../client_body_buffer_size/type.dhall
, client_body_in_single_buffer :
    Optional ../client_body_in_single_buffer/type.dhall
, client_body_temp_path : Optional ../client_body_temp_path/type.dhall
, client_body_timeout : Optional ../client_body_timeout/type.dhall
, client_max_body_size : Optional ../client_max_body_size/type.dhall
, connection_pool_size : Optional ../connection_pool_size/type.dhall
, default_type : Optional ../default_type/type.dhall
, directio : Optional ../directio/type.dhall
, directio_alignment : Optional ../directio_alignment/type.dhall
, error_page : List ../error_page/type.dhall
, expires : Optional ../../ngx_http_headers_module/expires/type.dhall
, fastcgi_buffering :
    Optional ../../ngx_http_fastcgi_module/fastcgi_buffering/type.dhall
, fastcgi_cache_background_update :
    Optional
      ../../ngx_http_fastcgi_module/fastcgi_cache_background_update/type.dhall
, fastcgi_cache_key :
    Optional ../../ngx_http_fastcgi_module/fastcgi_cache_key/type.dhall
, fastcgi_cache_lock :
    Optional ../../ngx_http_fastcgi_module/fastcgi_cache_lock/type.dhall
, fastcgi_cache_max_range_offset :
    Optional
      ../../ngx_http_fastcgi_module/fastcgi_cache_max_range_offset/type.dhall
, fastcgi_cache_min_uses :
    Optional ../../ngx_http_fastcgi_module/fastcgi_cache_min_uses/type.dhall
, fastcgi_cache_revalidate :
    Optional ../../ngx_http_fastcgi_module/fastcgi_cache_revalidate/type.dhall
, fastcgi_catch_stderr :
    Optional ../../ngx_http_fastcgi_module/fastcgi_catch_stderr/type.dhall
, fastcgi_force_ranges :
    Optional ../../ngx_http_fastcgi_module/fastcgi_force_ranges/type.dhall
, fastcgi_hide_header :
    Optional ../../ngx_http_fastcgi_module/fastcgi_hide_header/type.dhall
, fastcgi_ignore_client_abort :
    Optional
      ../../ngx_http_fastcgi_module/fastcgi_ignore_client_abort/type.dhall
, fastcgi_index :
    Optional ../../ngx_http_fastcgi_module/fastcgi_index/type.dhall
, fastcgi_intercept_errors :
    Optional ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/type.dhall
, fastcgi_keep_conn :
    Optional ../../ngx_http_fastcgi_module/fastcgi_keep_conn/type.dhall
, fastcgi_limit_rate :
    Optional ../../ngx_http_fastcgi_module/fastcgi_limit_rate/type.dhall
, fastcgi_max_temp_file_size :
    Optional ../../ngx_http_fastcgi_module/fastcgi_max_temp_file_size/type.dhall
, fastcgi_next_upstream_tries :
    Optional
      ../../ngx_http_fastcgi_module/fastcgi_next_upstream_tries/type.dhall
, fastcgi_param : List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
, fastcgi_pass : Optional ../../ngx_http_fastcgi_module/fastcgi_pass/type.dhall
, fastcgi_pass_header :
    Optional ../../ngx_http_fastcgi_module/fastcgi_pass_header/type.dhall
, fastcgi_pass_request_body :
    Optional ../../ngx_http_fastcgi_module/fastcgi_pass_request_body/type.dhall
, fastcgi_pass_request_headers :
    Optional
      ../../ngx_http_fastcgi_module/fastcgi_pass_request_headers/type.dhall
, fastcgi_request_buffering :
    Optional ../../ngx_http_fastcgi_module/fastcgi_request_buffering/type.dhall
, fastcgi_send_lowat :
    Optional ../../ngx_http_fastcgi_module/fastcgi_send_lowat/type.dhall
, fastcgi_socket_keepalive :
    Optional ../../ngx_http_fastcgi_module/fastcgi_socket_keepalive/type.dhall
, fastcgi_store :
    Optional ../../ngx_http_fastcgi_module/fastcgi_store/type.dhall
, fastcgi_store_access :
    Optional ../../ngx_http_fastcgi_module/fastcgi_store_access/type.dhall
, fastcgi_temp_file_write_size :
    Optional
      ../../ngx_http_fastcgi_module/fastcgi_temp_file_write_size/type.dhall
, fastcgi_temp_path :
    Optional ../../ngx_http_fastcgi_module/fastcgi_temp_path/type.dhall
, gzip : Optional ../../ngx_http_gzip_module/gzip/type.dhall
, gzip_min_length :
    Optional ../../ngx_http_gzip_module/gzip_min_length/type.dhall
, gzip_types : ../../ngx_http_gzip_module/gzip_types/type.dhall
, gzip_vary : Optional ../../ngx_http_gzip_module/gzip_vary/type.dhall
, index : Optional ../../ngx_http_index_module/index/type.dhall
, internal : Optional ../internal/type.dhall
, keepalive_requests : Optional ../keepalive_requests/type.dhall
, keepalive_time : Optional ../keepalive_time/type.dhall
, keepalive_timeout : Optional ../keepalive_timeout/type.dhall
, limit_rate : Optional ../limit_rate/type.dhall
, limit_rate_after : Optional ../limit_rate_after/type.dhall
, lingering_close : Optional ../lingering_close/type.dhall
, lingering_time : Optional ../lingering_time/type.dhall
, lingering_timeout : Optional ../lingering_timeout/type.dhall
, log_not_found : Optional ../log_not_found/type.dhall
, log_subrequest : Optional ../log_subrequest/type.dhall
, max_ranges : Optional ../max_ranges/type.dhall
, msie_refresh : Optional ../msie_refresh/type.dhall
, modifier : ./modifier.dhall
, msie_padding : Optional ../msie_padding/type.dhall
, name : Optional Text
, open_file_cache_errors : Optional ../open_file_cache_errors/type.dhall
, open_file_cache_min_uses : Optional ../open_file_cache_min_uses/type.dhall
, open_file_cache_valid : Optional ../open_file_cache_valid/type.dhall
, port_in_redirect : Optional ../port_in_redirect/type.dhall
, postpone_output : Optional ../postpone_output/type.dhall
, proxy_buffering :
    Optional ../../ngx_http_proxy_module/proxy_buffering/type.dhall
, proxy_buffers : Optional ../../ngx_http_proxy_module/proxy_buffers/type.dhall
, proxy_cache : Optional ../../ngx_http_proxy_module/proxy_cache/type.dhall
, proxy_connect_timeout :
    Optional ../../ngx_http_proxy_module/proxy_connect_timeout/type.dhall
, proxy_pass : Optional ../../ngx_http_proxy_module/proxy_pass/type.dhall
, proxy_read_timeout :
    Optional ../../ngx_http_proxy_module/proxy_read_timeout/type.dhall
, proxy_redirect :
    Optional ../../ngx_http_proxy_module/proxy_redirect/type.dhall
, proxy_send_timeout :
    Optional ../../ngx_http_proxy_module/proxy_send_timeout/type.dhall
, proxy_set_header : ../../ngx_http_proxy_module/proxy_set_header/type.dhall
, proxy_temp_path :
    Optional ../../ngx_http_proxy_module/proxy_temp_path/type.dhall
, read_ahead : Optional ../read_ahead/type.dhall
, recursive_error_pages : Optional ../recursive_error_pages/type.dhall
, reset_timedout_connection : Optional ../reset_timedout_connection/type.dhall
, resolver_timeout : Optional ../resolver_timeout/type.dhall
, rewrite : Optional ../../ngx_http_rewrite_module/rewrite/type.dhall
, rewrite_log : Optional ../../ngx_http_rewrite_module/rewrite_log/type.dhall
, root : Optional ../../ngx_http_core_module/root/type.dhall
, satisfy : Optional ../satisfy/type.dhall
, send_lowat : Optional ../send_lowat/type.dhall
, send_timeout : Optional ../send_timeout/type.dhall
, sendfile_max_chunk : Optional ../sendfile_max_chunk/type.dhall
, server_name_in_redirect : Optional ../server_name_in_redirect/type.dhall
, server_tokens : Optional ../server_tokens/type.dhall
, subrequest_output_buffer_size :
    Optional ../subrequest_output_buffer_size/type.dhall
, tcp_nopush : Optional ../tcp_nopush/type.dhall
, try_files : Optional ../try_files/type.dhall
, types_hash_bucket_size : Optional ../types_hash_bucket_size/type.dhall
, types_hash_max_size : Optional ../types_hash_max_size/type.dhall
, uninitialized_variable_warn :
    Optional
      ../../ngx_http_rewrite_module/uninitialized_variable_warn/type.dhall
, uri : Text
}
