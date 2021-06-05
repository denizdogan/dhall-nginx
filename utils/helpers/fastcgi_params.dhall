let fastcgi_param =
      ../../directives/ngx_http_fastcgi_module/fastcgi_param/schema.dhall

let p =
      \(param : Text) ->
      \(value : Text) ->
        fastcgi_param::{ parameter = param, value }

in  [ p "QUERY_STRING" "\$query_string"
    , p "REQUEST_METHOD" "\$request_method"
    , p "CONTENT_TYPE" "\$content_type"
    , p "CONTENT_LENGTH" "\$content_length"
    , p "SCRIPT_FILENAME" "\$document_root\$fastcgi_script_name"
    , p "SCRIPT_NAME" "\$fastcgi_script_name"
    , p "PATH_INFO" "\$fastcgi_path_info"
    , p "PATH_TRANSLATED" "\$document_root\$fastcgi_path_info"
    , p "REQUEST_URI" "\$request_uri"
    , p "DOCUMENT_URI" "\$document_uri"
    , p "DOCUMENT_ROOT" "\$document_root"
    , p "SERVER_PROTOCOL" "\$server_protocol"
    , p "GATEWAY_INTERFACE" "CGI/1.1"
    , p "SERVER_SOFTWARE" "nginx/\$nginx_version"
    , p "REMOTE_ADDR" "\$remote_addr"
    , p "REMOTE_PORT" "\$remote_port"
    , p "SERVER_ADDR" "\$server_addr"
    , p "SERVER_PORT" "\$server_port"
    , p "SERVER_NAME" "\$server_name"
    , p "HTTPS" "\$https"
    , p "REDIRECT_STATUS" "200"
    ]
