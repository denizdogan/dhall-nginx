{ default_type : Optional ../default_type/type.dhall
, fastcgi_intercept_errors :
    Optional ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/type.dhall
, if_modified_since : Optional ../if_modified_since/type.dhall
, index : Optional ../../ngx_http_index_module/index/type.dhall
, log_format : List ../../ngx_http_log_module/log_format/type.dhall
, log_not_found : Optional ../log_not_found/type.dhall
, map : List ../../ngx_http_map_module/map/type.dhall
, sendfile : Optional ../sendfile/type.dhall
, server : List ../../ngx_http_core_module/server/type.dhall
, types : Optional ../types/type.dhall
, upstream : List ../../ngx_http_upstream_module/upstream/type.dhall
}
