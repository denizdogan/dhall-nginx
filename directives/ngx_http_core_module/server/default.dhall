{ access_log = None ../../ngx_http_log_module/access_log/type.dhall
, add_header = [] : List ../../ngx_http_headers_module/add_header/type.dhall
, add_trailer = [] : List ../../ngx_http_headers_module/add_trailer/type.dhall
, default_type = None ../default_type/type.dhall
, expires = None ../../ngx_http_headers_module/expires/type.dhall
, fastcgi_intercept_errors =
    None ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/type.dhall
, fastcgi_param =
    [] : List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
, index = None ../../ngx_http_index_module/index/type.dhall
, location = [] : List ../location/type.dhall
, log_not_found = None ../log_not_found/type.dhall
, root = None ../../ngx_http_core_module/root/type.dhall
, server_name = ../server_name/type.dhall
, tcp_nodelay = ../tcp_nodelay/type.dhall
, try_files = None ../try_files/type.dhall
}
