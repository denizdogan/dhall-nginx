let ngx_http_fastcgi_module = ../../ngx_http_fastcgi_module/package.dhall

in  { access_rules : List ../../ngx_http_access_module/access_rule/type.dhall
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
    , default_type : Optional ../default_type/type.dhall
    , expires : Optional ../../ngx_http_headers_module/expires/type.dhall
    , fastcgi_buffering :
        Optional ngx_http_fastcgi_module.fastcgi_buffering.Type
    , fastcgi_cache_background_update :
        Optional ngx_http_fastcgi_module.fastcgi_cache_background_update.Type
    , fastcgi_cache_key :
        Optional ngx_http_fastcgi_module.fastcgi_cache_key.Type
    , fastcgi_cache_lock :
        Optional ngx_http_fastcgi_module.fastcgi_cache_lock.Type
    , fastcgi_cache_lock_age :
        Optional ngx_http_fastcgi_module.fastcgi_cache_lock_age.Type
    , fastcgi_cache_lock_timeout :
        Optional ngx_http_fastcgi_module.fastcgi_cache_lock_timeout.Type
    , fastcgi_cache_max_range_offset :
        Optional ngx_http_fastcgi_module.fastcgi_cache_max_range_offset.Type
    , fastcgi_cache_min_uses :
        Optional ngx_http_fastcgi_module.fastcgi_cache_min_uses.Type
    , fastcgi_cache_revalidate :
        Optional ngx_http_fastcgi_module.fastcgi_cache_revalidate.Type
    , fastcgi_catch_stderr :
        Optional ngx_http_fastcgi_module.fastcgi_catch_stderr.Type
    , fastcgi_connect_timeout :
        Optional ngx_http_fastcgi_module.fastcgi_connect_timeout.Type
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
    , fastcgi_next_upstream_timeout :
        Optional ngx_http_fastcgi_module.fastcgi_next_upstream_timeout.Type
    , fastcgi_next_upstream_tries :
        Optional ngx_http_fastcgi_module.fastcgi_next_upstream_tries.Type
    , fastcgi_pass_header :
        Optional ngx_http_fastcgi_module.fastcgi_pass_header.Type
    , fastcgi_pass_request_body :
        Optional ngx_http_fastcgi_module.fastcgi_pass_request_body.Type
    , fastcgi_pass_request_headers :
        Optional ngx_http_fastcgi_module.fastcgi_pass_request_headers.Type
    , fastcgi_read_timeout :
        Optional ngx_http_fastcgi_module.fastcgi_read_timeout.Type
    , fastcgi_request_buffering :
        Optional ngx_http_fastcgi_module.fastcgi_request_buffering.Type
    , fastcgi_send_timeout :
        Optional ngx_http_fastcgi_module.fastcgi_send_timeout.Type
    , fastcgi_socket_keepalive :
        Optional ngx_http_fastcgi_module.fastcgi_socket_keepalive.Type
    , fastcgi_param :
        List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
    , if_modified_since : Optional ../if_modified_since/type.dhall
    , index : Optional ../../ngx_http_index_module/index/type.dhall
    , log_format : List ../../ngx_http_log_module/log_format/type.dhall
    , log_not_found : Optional ../log_not_found/type.dhall
    , map : List ../../ngx_http_map_module/map/type.dhall
    , satisfy : Optional ../satisfy/type.dhall
    , sendfile : Optional ../sendfile/type.dhall
    , server : List ../../ngx_http_core_module/server/type.dhall
    , types : Optional ../types/type.dhall
    , upstream : List ../../ngx_http_upstream_module/upstream/type.dhall
    }
