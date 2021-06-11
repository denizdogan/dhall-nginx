let ngx_http_fastcgi_module = ../../ngx_http_fastcgi_module/package.dhall

in  { access_rules : List ../../ngx_http_access_module/access_rule/type.dhall
    , access_log : Optional ../../ngx_http_log_module/access_log/type.dhall
    , add_header : List ../../ngx_http_headers_module/add_header/type.dhall
    , add_trailer : List ../../ngx_http_headers_module/add_trailer/type.dhall
    , auth_basic :
        Optional ../../ngx_http_auth_basic_module/auth_basic/type.dhall
    , auth_basic_user_file :
        Optional
          ../../ngx_http_auth_basic_module/auth_basic_user_file/type.dhall
    , autoindex : Optional ../../ngx_http_autoindex_module/autoindex/type.dhall
    , autoindex_exact_size :
        Optional ../../ngx_http_autoindex_module/autoindex_exact_size/type.dhall
    , autoindex_format :
        Optional ../../ngx_http_autoindex_module/autoindex_format/type.dhall
    , autoindex_localtime :
        Optional ../../ngx_http_autoindex_module/autoindex_localtime/type.dhall
    , client_body_buffer_size : Optional ../client_body_buffer_size/type.dhall
    , client_header_buffer_size :
        Optional ../client_header_buffer_size/type.dhall
    , client_max_body_size : Optional ../client_max_body_size/type.dhall
    , connection_pool_size : Optional ../connection_pool_size/type.dhall
    , default_type : Optional ../default_type/type.dhall
    , directio : Optional ../directio/type.dhall
    , directio_alignment : Optional ../directio_alignment/type.dhall
    , expires : Optional ../../ngx_http_headers_module/expires/type.dhall
    , fastcgi_buffering :
        Optional ngx_http_fastcgi_module.fastcgi_buffering.Type
    , fastcgi_cache_background_update :
        Optional ngx_http_fastcgi_module.fastcgi_cache_background_update.Type
    , fastcgi_cache_key :
        Optional ngx_http_fastcgi_module.fastcgi_cache_key.Type
    , fastcgi_cache_lock :
        Optional ngx_http_fastcgi_module.fastcgi_cache_lock.Type
    , fastcgi_cache_max_range_offset :
        Optional ngx_http_fastcgi_module.fastcgi_cache_max_range_offset.Type
    , fastcgi_cache_min_uses :
        Optional ngx_http_fastcgi_module.fastcgi_cache_min_uses.Type
    , fastcgi_cache_revalidate :
        Optional ngx_http_fastcgi_module.fastcgi_cache_revalidate.Type
    , fastcgi_catch_stderr :
        Optional ngx_http_fastcgi_module.fastcgi_catch_stderr.Type
    , fastcgi_force_ranges :
        Optional ngx_http_fastcgi_module.fastcgi_force_ranges.Type
    , fastcgi_hide_header :
        Optional ngx_http_fastcgi_module.fastcgi_hide_header.Type
    , fastcgi_ignore_client_abort :
        Optional ngx_http_fastcgi_module.fastcgi_ignore_client_abort.Type
    , fastcgi_index : Optional ngx_http_fastcgi_module.fastcgi_index.Type
    , fastcgi_intercept_errors :
        Optional ngx_http_fastcgi_module.fastcgi_intercept_errors.Type
    , fastcgi_keep_conn :
        Optional ngx_http_fastcgi_module.fastcgi_keep_conn.Type
    , fastcgi_limit_rate :
        Optional ngx_http_fastcgi_module.fastcgi_limit_rate.Type
    , fastcgi_next_upstream_tries :
        Optional ngx_http_fastcgi_module.fastcgi_next_upstream_tries.Type
    , fastcgi_pass_header :
        Optional ngx_http_fastcgi_module.fastcgi_pass_header.Type
    , fastcgi_pass_request_body :
        Optional ngx_http_fastcgi_module.fastcgi_pass_request_body.Type
    , fastcgi_pass_request_headers :
        Optional ngx_http_fastcgi_module.fastcgi_pass_request_headers.Type
    , fastcgi_request_buffering :
        Optional ngx_http_fastcgi_module.fastcgi_request_buffering.Type
    , fastcgi_socket_keepalive :
        Optional ngx_http_fastcgi_module.fastcgi_socket_keepalive.Type
    , fastcgi_param :
        List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
    , index : Optional ../../ngx_http_index_module/index/type.dhall
    , limit_rate_after : Optional ../limit_rate_after/type.dhall
    , location : List ../location/type.dhall
    , log_not_found : Optional ../log_not_found/type.dhall
    , postpone_output : Optional ../postpone_output/type.dhall
    , request_pool_size : Optional ../request_pool_size/type.dhall
    , root : Optional ../../ngx_http_core_module/root/type.dhall
    , satisfy : Optional ../satisfy/type.dhall
    , send_lowat : Optional ../send_lowat/type.dhall
    , sendfile_max_chunk : Optional ../sendfile_max_chunk/type.dhall
    , server_name : ../server_name/type.dhall
    , subrequest_output_buffer_size :
        Optional ../subrequest_output_buffer_size/type.dhall
    , tcp_nodelay : Optional ../tcp_nodelay/type.dhall
    , try_files : Optional ../try_files/type.dhall
    , types_hash_bucket_size : Optional ../types_hash_bucket_size/type.dhall
    , types_hash_max_size : Optional ../types_hash_max_size/type.dhall
    }
