{ access_rules : List ../../ngx_http_access_module/access_rule/type.dhall
, access_log : Optional ../../ngx_http_log_module/access_log/type.dhall
, add_header : List ../../ngx_http_headers_module/add_header/type.dhall
, add_trailer : List ../../ngx_http_headers_module/add_trailer/type.dhall
, default_type : Optional ../default_type/type.dhall
, expires : Optional ../../ngx_http_headers_module/expires/type.dhall
, fastcgi_intercept_errors :
    Optional ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/type.dhall
, fastcgi_param : List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
, index : Optional ../../ngx_http_index_module/index/type.dhall
, location : List ../location/type.dhall
, log_not_found : Optional ../log_not_found/type.dhall
, root : Optional ../../ngx_http_core_module/root/type.dhall
, satisfy : Optional ../satisfy/type.dhall
, server_name : ../server_name/type.dhall
, tcp_nodelay : Optional ../tcp_nodelay/type.dhall
, try_files : Optional ../try_files/type.dhall
}
