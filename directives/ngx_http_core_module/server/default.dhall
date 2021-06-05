{ access_log = None ../../ngx_http_log_module/access_log/type.dhall
, default_type = None ../default_type/type.dhall
, index = None ../../ngx_http_index_module/index/type.dhall
, location = [] : List ../location/type.dhall
, log_not_found = None ../log_not_found/type.dhall
, root = None ../../ngx_http_core_module/root/type.dhall
, server_name = ../server_name/type.dhall
, tcp_nodelay = ../tcp_nodelay/type.dhall
}
