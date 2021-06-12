let ngx_http_fastcgi_module = ../../ngx_http_fastcgi_module/package.dhall

let modifier = ./modifier.dhall

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
    , client_body_in_single_buffer =
        None ../client_body_in_single_buffer/type.dhall
    , client_body_timeout = None ../client_body_timeout/type.dhall
    , client_max_body_size = None ../client_max_body_size/type.dhall
    , connection_pool_size = None ../connection_pool_size/type.dhall
    , default_type = None ../default_type/type.dhall
    , directio = None ../directio/type.dhall
    , directio_alignment = None ../directio_alignment/type.dhall
    , error_page = [] : List ../error_page/type.dhall
    , expires = None ../../ngx_http_headers_module/expires/type.dhall
    , fastcgi_buffering = None ngx_http_fastcgi_module.fastcgi_buffering.Type
    , fastcgi_cache_background_update =
        None ngx_http_fastcgi_module.fastcgi_cache_background_update.Type
    , fastcgi_cache_key = None ngx_http_fastcgi_module.fastcgi_cache_key.Type
    , fastcgi_cache_lock = None ngx_http_fastcgi_module.fastcgi_cache_lock.Type
    , fastcgi_cache_max_range_offset =
        None ngx_http_fastcgi_module.fastcgi_cache_max_range_offset.Type
    , fastcgi_cache_min_uses =
        None ngx_http_fastcgi_module.fastcgi_cache_min_uses.Type
    , fastcgi_cache_revalidate =
        None ngx_http_fastcgi_module.fastcgi_cache_revalidate.Type
    , fastcgi_catch_stderr =
        None ngx_http_fastcgi_module.fastcgi_catch_stderr.Type
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
    , fastcgi_next_upstream_tries =
        None ngx_http_fastcgi_module.fastcgi_next_upstream_tries.Type
    , fastcgi_param =
        [] : List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
    , fastcgi_pass = None ngx_http_fastcgi_module.fastcgi_pass.Type
    , fastcgi_pass_header =
        None ngx_http_fastcgi_module.fastcgi_pass_header.Type
    , fastcgi_pass_request_body =
        None ngx_http_fastcgi_module.fastcgi_pass_request_body.Type
    , fastcgi_pass_request_headers =
        None ngx_http_fastcgi_module.fastcgi_pass_request_headers.Type
    , fastcgi_request_buffering =
        None ngx_http_fastcgi_module.fastcgi_request_buffering.Type
    , fastcgi_socket_keepalive =
        None ngx_http_fastcgi_module.fastcgi_socket_keepalive.Type
    , gzip = None ../../ngx_http_gzip_module/gzip/type.dhall
    , gzip_types = [] : ../../ngx_http_gzip_module/gzip_types/type.dhall
    , index = None ../../ngx_http_index_module/index/type.dhall
    , keepalive_requests = None ../keepalive_requests/type.dhall
    , keepalive_time = None ../keepalive_time/type.dhall
    , keepalive_timeout = None ../keepalive_timeout/type.dhall
    , limit_rate_after = None ../limit_rate_after/type.dhall
    , lingering_time = None ../lingering_time/type.dhall
    , lingering_timeout = None ../lingering_timeout/type.dhall
    , log_not_found = None ../log_not_found/type.dhall
    , log_subrequest = None ../log_subrequest/type.dhall
    , max_ranges = None ../max_ranges/type.dhall
    , modifier = modifier.prefix
    , msie_padding = None ../msie_padding/type.dhall
    , msie_refresh = None ../msie_refresh/type.dhall
    , name = None Text
    , open_file_cache_errors = None ../open_file_cache_errors/type.dhall
    , open_file_cache_min_uses = None ../open_file_cache_min_uses/type.dhall
    , open_file_cache_valid = None ../open_file_cache_valid/type.dhall
    , port_in_redirect = None ../port_in_redirect/type.dhall
    , postpone_output = None ../postpone_output/type.dhall
    , proxy_buffers = None ../../ngx_http_proxy_module/proxy_buffers/type.dhall
    , proxy_connect_timeout =
        None ../../ngx_http_proxy_module/proxy_connect_timeout/type.dhall
    , proxy_pass = None ../../ngx_http_proxy_module/proxy_pass/type.dhall
    , proxy_read_timeout =
        None ../../ngx_http_proxy_module/proxy_read_timeout/type.dhall
    , proxy_redirect =
        None ../../ngx_http_proxy_module/proxy_redirect/type.dhall
    , proxy_send_timeout =
        None ../../ngx_http_proxy_module/proxy_send_timeout/type.dhall
    , proxy_set_header =
        [] : ../../ngx_http_proxy_module/proxy_set_header/type.dhall
    , recursive_error_pages = None ../recursive_error_pages/type.dhall
    , reset_timedout_connection = None ../reset_timedout_connection/type.dhall
    , resolver_timeout = None ../resolver_timeout/type.dhall
    , rewrite = None ../../ngx_http_rewrite_module/rewrite/type.dhall
    , rewrite_log = None ../../ngx_http_rewrite_module/rewrite_log/type.dhall
    , root = None ../../ngx_http_core_module/root/type.dhall
    , satisfy = None ../satisfy/type.dhall
    , send_lowat = None ../send_lowat/type.dhall
    , send_timeout = None ../send_timeout/type.dhall
    , sendfile_max_chunk = None ../sendfile_max_chunk/type.dhall
    , server_name_in_redirect = None ../server_name_in_redirect/type.dhall
    , subrequest_output_buffer_size =
        None ../subrequest_output_buffer_size/type.dhall
    , tcp_nopush = None ../tcp_nopush/type.dhall
    , try_files = None ../try_files/type.dhall
    , types_hash_bucket_size = None ../types_hash_bucket_size/type.dhall
    , types_hash_max_size = None ../types_hash_max_size/type.dhall
    , uninitialized_variable_warn =
        None
          ../../ngx_http_rewrite_module/uninitialized_variable_warn/type.dhall
    , uri = None Text
    }
