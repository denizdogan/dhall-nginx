{ access_log : Optional ../../ngx_http_log_module/access_log/type.dhall
, access_rules : List ../../ngx_http_access_module/access_rule/type.dhall
, add_header : List ../../ngx_http_headers_module/add_header/type.dhall
, add_trailer : List ../../ngx_http_headers_module/add_trailer/type.dhall
, autoindex : Optional ../../ngx_http_autoindex_module/autoindex/type.dhall
, autoindex_exact_size : Optional ../../ngx_http_autoindex_module/autoindex_exact_size/type.dhall
, autoindex_format : Optional ../../ngx_http_autoindex_module/autoindex_format/type.dhall
, autoindex_localtime : Optional ../../ngx_http_autoindex_module/autoindex_localtime/type.dhall
, default_type : Optional ../default_type/type.dhall
, expires : Optional ../../ngx_http_headers_module/expires/type.dhall
, fastcgi_intercept_errors :
    Optional ../../ngx_http_fastcgi_module/fastcgi_intercept_errors/type.dhall
, fastcgi_param : List ../../ngx_http_fastcgi_module/fastcgi_param/type.dhall
, fastcgi_pass : Optional ../../ngx_http_fastcgi_module/fastcgi_pass/type.dhall
, index : Optional ../../ngx_http_index_module/index/type.dhall
, log_not_found : Optional ../log_not_found/type.dhall
, log_subrequest : Optional ../log_subrequest/type.dhall
, max_ranges : Optional ../max_ranges/type.dhall
, modifier : ./modifier.dhall
, msie_padding : Optional ../msie_padding/type.dhall
, name : Optional Text
, satisfy : Optional ../satisfy/type.dhall
, try_files : Optional ../try_files/type.dhall
, uri : Text
}
