let ngx_http_fastcgi_module = ../../ngx_http_fastcgi_module/package.dhall

in  { access_rules =
        [] : List ../../ngx_http_access_module/access_rule/type.dhall
    , access_log = None ../../ngx_http_log_module/access_log/type.dhall
    , add_header = [] : List ../../ngx_http_headers_module/add_header/type.dhall
    , add_trailer =
        [] : List ../../ngx_http_headers_module/add_trailer/type.dhall
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
    , default_type = None ../default_type/type.dhall
    , expires = None ../../ngx_http_headers_module/expires/type.dhall
    , fastcgi_intercept_errors =
        None ngx_http_fastcgi_module.fastcgi_intercept_errors.Type
    , fastcgi_param =
        [] : List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
    , index = None ../../ngx_http_index_module/index/type.dhall
    , location = [] : List ../location/type.dhall
    , log_not_found = None ../log_not_found/type.dhall
    , root = None ../../ngx_http_core_module/root/type.dhall
    , satisfy = None ../satisfy/type.dhall
    , server_name = None ../server_name/type.dhall
    , tcp_nodelay = None ../tcp_nodelay/type.dhall
    , try_files = None ../try_files/type.dhall
    }
