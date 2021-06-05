{ access_log : Optional ../../ngx_http_log_module/access_log/type.dhall
, default_type : Optional ../default_type/type.dhall
, fastcgi_intercept_errors :
    Optional ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/type.dhall
, fastcgi_param : List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
, index : Optional ../../ngx_http_index_module/index/type.dhall
, location : List ../location/type.dhall
, log_not_found : Optional ../log_not_found/type.dhall
, root : Optional ../../ngx_http_core_module/root/type.dhall
, server_name : ../server_name/type.dhall
, tcp_nodelay : Optional ../tcp_nodelay/type.dhall
}
