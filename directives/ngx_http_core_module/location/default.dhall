let modifier = ./modifier.dhall

in  { default_type = None ../default_type/type.dhall
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
    , try_files = None ../try_files/type.dhall
    , uri = None Text
    }
