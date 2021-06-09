{ access_rules : List ../../ngx_http_access_module/access_rule/type.dhall
, add_header : List ../../ngx_http_headers_module/add_header/type.dhall
, add_trailer : List ../../ngx_http_headers_module/add_trailer/type.dhall
, auth_basic : Optional ../../ngx_http_auth_basic_module/auth_basic/type.dhall
, auth_basic_user_file :
    Optional ../../ngx_http_auth_basic_module/auth_basic_user_file/type.dhall
, autoindex : Optional ../../ngx_http_autoindex_module/autoindex/type.dhall
, autoindex_exact_size :
    Optional ../../ngx_http_autoindex_module/autoindex_exact_size/type.dhall
, autoindex_format :
    Optional ../../ngx_http_autoindex_module/autoindex_format/type.dhall
, autoindex_localtime :
    Optional ../../ngx_http_autoindex_module/autoindex_localtime/type.dhall
, default_type : Optional ../default_type/type.dhall
, expires : Optional ../../ngx_http_headers_module/expires/type.dhall
, fastcgi_intercept_errors :
    Optional ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/type.dhall
, fastcgi_param : List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
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
