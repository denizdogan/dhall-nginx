{ default_type = None ../default_type/type.dhall
, if_modified_since = None ../if_modified_since/type.dhall
, log_format = [] : List ../../ngx_http_log_module/log_format/type.dhall
, maps = [] : List ../../ngx_http_map_module/map/type.dhall
, sendfile = None ../sendfile/type.dhall
, servers = [] : List ../../ngx_http_core_module/server/type.dhall
, types = None ../types/type.dhall
, upstreams = [] : List ../../ngx_http_upstream_module/upstream/type.dhall
}