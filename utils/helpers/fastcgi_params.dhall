let fastcgi_param =
      ../../directives/ngx_http_fastcgi_module/fastcgi_param/schema.dhall

let p =
      \(param : Text) ->
      \(value : Text) ->
        fastcgi_param::{ parameter = param, value }

in  [ p "CONTENT_LENGTH" "\$content_length"
    , p "CONTENT_TYPE" "\$content_type"
    , p "DOCUMENT_ROOT" "\$document_root"
    , p "DOCUMENT_URI" "\$document_uri"
    , p "GATEWAY_INTERFACE" "CGI/1.1"
    , p "HTTPS" "\$https"
    , p "PATH_INFO" "\$fastcgi_path_info"
    , p "PATH_TRANSLATED" "\$document_root\$fastcgi_path_info"
    , p "QUERY_STRING" "\$query_string"
    , p "REDIRECT_STATUS" "200"
    , p "REMOTE_ADDR" "\$remote_addr"
    , p "REMOTE_PORT" "\$remote_port"
    , p "REQUEST_METHOD" "\$request_method"
    , p "REQUEST_URI" "\$request_uri"
    , p "SCRIPT_FILENAME" "\$document_root\$fastcgi_script_name"
    , p "SCRIPT_NAME" "\$fastcgi_script_name"
    , p "SERVER_ADDR" "\$server_addr"
    , p "SERVER_NAME" "\$server_name"
    , p "SERVER_PORT" "\$server_port"
    , p "SERVER_PROTOCOL" "\$server_protocol"
    , p "SERVER_SOFTWARE" "nginx/\$nginx_version"
    ]
