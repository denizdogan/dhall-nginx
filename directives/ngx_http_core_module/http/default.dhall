{ access_rules = [] : List ../../ngx_http_access_module/access_rule/type.dhall
, add_header = [] : List ../../ngx_http_headers_module/add_header/type.dhall
, add_trailer = [] : List ../../ngx_http_headers_module/add_trailer/type.dhall
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
, if_modified_since = None ../if_modified_since/type.dhall
, index = None ../../ngx_http_index_module/index/type.dhall
, log_format = [] : List ../../ngx_http_log_module/log_format/type.dhall
, log_not_found = None ../log_not_found/type.dhall
, map = [] : List ../../ngx_http_map_module/map/type.dhall
, satisfy = None ../satisfy/type.dhall
, sendfile = None ../sendfile/type.dhall
, server = [] : List ../../ngx_http_core_module/server/type.dhall
, types = None ../types/type.dhall
, upstream = [] : List ../../ngx_http_upstream_module/upstream/type.dhall
}
