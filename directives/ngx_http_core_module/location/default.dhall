let modifier = ./modifier.dhall

in  { access_log = None ../../ngx_http_log_module/access_log/type.dhall
    , access_rules =
        [] : List ../../ngx_http_access_module/access_rule/type.dhall
    , add_header = [] : List ../../ngx_http_headers_module/add_header/type.dhall
    , add_trailer =
        [] : List ../../ngx_http_headers_module/add_trailer/type.dhall
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
        None ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/type.dhall
    , fastcgi_param =
        [] : List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
    , fastcgi_pass = None ../../ngx_http_fastcgi_module/fastcgi_pass/type.dhall
    , index = None ../../ngx_http_index_module/index/type.dhall
    , log_not_found = None ../log_not_found/type.dhall
    , log_subrequest = None ../log_subrequest/type.dhall
    , max_ranges = None ../max_ranges/type.dhall
    , modifier = modifier.prefix
    , msie_padding = None ../msie_padding/type.dhall
    , name = None Text
    , satisfy = None ../satisfy/type.dhall
    , try_files = None ../try_files/type.dhall
    , uri = None Text
    }
