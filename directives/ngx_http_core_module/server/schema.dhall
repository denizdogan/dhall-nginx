let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let indent = ../../../utils/indent.dhall

let optList = ../../../utils/optList.dhall

let access_log = ../../ngx_http_log_module/access_log/schema.dhall

let access_rule = ../../ngx_http_access_module/access_rule/schema.dhall

let add_header = ../../ngx_http_headers_module/add_header/schema.dhall

let add_trailer = ../../ngx_http_headers_module/add_trailer/schema.dhall

let auth_basic = ../../ngx_http_auth_basic_module/auth_basic/schema.dhall

let auth_basic_user_file =
      ../../ngx_http_auth_basic_module/auth_basic_user_file/schema.dhall

let autoindex = ../../ngx_http_autoindex_module/autoindex/schema.dhall

let autoindex_exact_size =
      ../../ngx_http_autoindex_module/autoindex_exact_size/schema.dhall

let autoindex_format =
      ../../ngx_http_autoindex_module/autoindex_format/schema.dhall

let autoindex_localtime =
      ../../ngx_http_autoindex_module/autoindex_localtime/schema.dhall

let client_body_buffer_size = ../client_body_buffer_size/schema.dhall

let client_header_buffer_size = ../client_header_buffer_size/schema.dhall

let client_max_body_size = ../client_max_body_size/schema.dhall

let connection_pool_size = ../connection_pool_size/schema.dhall

let default_type = ../default_type/schema.dhall

let directio = ../directio/schema.dhall

let directio_alignment = ../directio_alignment/schema.dhall

let expires = ../../ngx_http_headers_module/expires/schema.dhall

let ngx_http_fastcgi_module = ../../ngx_http_fastcgi_module/package.dhall

let fastcgi_buffering =
      ../../ngx_http_fastcgi_module/fastcgi_buffering/schema.dhall

let fastcgi_cache_background_update =
      ../../ngx_http_fastcgi_module/fastcgi_cache_background_update/schema.dhall

let fastcgi_cache_key =
      ../../ngx_http_fastcgi_module/fastcgi_cache_key/schema.dhall

let fastcgi_cache_lock =
      ../../ngx_http_fastcgi_module/fastcgi_cache_lock/schema.dhall

let fastcgi_cache_max_range_offset =
      ../../ngx_http_fastcgi_module/fastcgi_cache_max_range_offset/schema.dhall

let fastcgi_cache_min_uses =
      ../../ngx_http_fastcgi_module/fastcgi_cache_min_uses/schema.dhall

let fastcgi_cache_revalidate =
      ../../ngx_http_fastcgi_module/fastcgi_cache_revalidate/schema.dhall

let fastcgi_catch_stderr =
      ../../ngx_http_fastcgi_module/fastcgi_catch_stderr/schema.dhall

let fastcgi_force_ranges =
      ../../ngx_http_fastcgi_module/fastcgi_force_ranges/schema.dhall

let fastcgi_hide_header =
      ../../ngx_http_fastcgi_module/fastcgi_hide_header/schema.dhall

let fastcgi_ignore_client_abort =
      ../../ngx_http_fastcgi_module/fastcgi_ignore_client_abort/schema.dhall

let fastcgi_index = ../../ngx_http_fastcgi_module/fastcgi_index/schema.dhall

let fastcgi_intercept_errors = ngx_http_fastcgi_module.fastcgi_intercept_errors

let fastcgi_keep_conn =
      ../../ngx_http_fastcgi_module/fastcgi_keep_conn/schema.dhall

let fastcgi_limit_rate =
      ../../ngx_http_fastcgi_module/fastcgi_limit_rate/schema.dhall

let fastcgi_next_upstream_tries =
      ../../ngx_http_fastcgi_module/fastcgi_next_upstream_tries/schema.dhall

let fastcgi_pass_header =
      ../../ngx_http_fastcgi_module/fastcgi_pass_header/schema.dhall

let fastcgi_pass_request_body =
      ../../ngx_http_fastcgi_module/fastcgi_pass_request_body/schema.dhall

let fastcgi_request_buffering =
      ../../ngx_http_fastcgi_module/fastcgi_request_buffering/schema.dhall

let fastcgi_socket_keepalive =
      ../../ngx_http_fastcgi_module/fastcgi_socket_keepalive/schema.dhall

let fastcgi_param = ../../ngx_http_fastcgi_module/fastcgi_param/schema.dhall

let limit_rate_after = ../limit_rate_after/schema.dhall

let location = ../location/schema.dhall

let log_not_found = ../log_not_found/schema.dhall

let postpone_output = ../postpone_output/schema.dhall

let request_pool_size = ../request_pool_size/schema.dhall

let root = ../../ngx_http_core_module/root/schema.dhall

let satisfy = ../satisfy/schema.dhall

let send_lowat = ../send_lowat/schema.dhall

let sendfile_max_chunk = ../sendfile_max_chunk/schema.dhall

let server_name = ../server_name/schema.dhall

let subrequest_output_buffer_size =
      ../subrequest_output_buffer_size/schema.dhall

let tcp_nodelay = ../tcp_nodelay/schema.dhall

let try_files = ../try_files/schema.dhall

let types_hash_bucket_size = ../types_hash_bucket_size/schema.dhall

let types_hash_max_size = ../types_hash_max_size/schema.dhall

let index = ../../ngx_http_index_module/index/schema.dhall

let type = ./type.dhall

let default = ./default.dhall

let make =
      λ(n : Natural) →
      λ(c : type) →
        let access_log =
              Optional/map
                access_log.Type
                Text
                (access_log.make (n + 2))
                c.access_log

        let access_rules =
              optList access_rule.Type (access_rule.make (n + 2)) c.access_rules

        let add_header =
              optList add_header.Type (add_header.make (n + 2)) c.add_header

        let add_trailer =
              optList add_trailer.Type (add_trailer.make (n + 2)) c.add_trailer

        let auth_basic =
              Optional/map
                auth_basic.Type
                Text
                (auth_basic.make (n + 2))
                c.auth_basic

        let auth_basic_user_file =
              Optional/map
                auth_basic_user_file.Type
                Text
                (auth_basic_user_file.make (n + 2))
                c.auth_basic_user_file

        let autoindex =
              Optional/map
                autoindex.Type
                Text
                (autoindex.make (n + 2))
                c.autoindex

        let autoindex_exact_size =
              Optional/map
                autoindex_exact_size.Type
                Text
                (autoindex_exact_size.make (n + 2))
                c.autoindex_exact_size

        let autoindex_format =
              Optional/map
                autoindex_format.Type
                Text
                (autoindex_format.make (n + 2))
                c.autoindex_format

        let autoindex_localtime =
              Optional/map
                autoindex_localtime.Type
                Text
                (autoindex_localtime.make (n + 2))
                c.autoindex_localtime

        let client_body_buffer_size =
              client_body_buffer_size.opt c.client_body_buffer_size (n + 2)

        let client_header_buffer_size =
              client_header_buffer_size.opt c.client_header_buffer_size (n + 2)

        let client_max_body_size =
              client_max_body_size.opt c.client_max_body_size (n + 2)

        let connection_pool_size =
              connection_pool_size.opt c.connection_pool_size (n + 2)

        let default_type =
              Optional/map
                default_type.Type
                Text
                (default_type.make (n + 2))
                c.default_type

        let directio = directio.opt c.directio (n + 2)

        let directio_alignment =
              directio_alignment.opt c.directio_alignment (n + 2)

        let expires =
              Optional/map expires.Type Text (expires.make (n + 2)) c.expires

        let fastcgi_buffering =
              fastcgi_buffering.opt c.fastcgi_buffering (n + 2)

        let fastcgi_cache_background_update =
              fastcgi_cache_background_update.opt
                c.fastcgi_cache_background_update
                (n + 2)

        let fastcgi_cache_key =
              fastcgi_cache_key.opt c.fastcgi_cache_key (n + 2)

        let fastcgi_cache_lock =
              fastcgi_cache_lock.opt c.fastcgi_cache_lock (n + 2)

        let fastcgi_cache_max_range_offset =
              fastcgi_cache_max_range_offset.opt
                c.fastcgi_cache_max_range_offset
                (n + 2)

        let fastcgi_cache_min_uses =
              fastcgi_cache_min_uses.opt c.fastcgi_cache_min_uses (n + 2)

        let fastcgi_cache_revalidate =
              fastcgi_cache_revalidate.opt c.fastcgi_cache_revalidate (n + 2)

        let fastcgi_catch_stderr =
              fastcgi_catch_stderr.opt c.fastcgi_catch_stderr (n + 2)

        let fastcgi_force_ranges =
              fastcgi_force_ranges.opt c.fastcgi_force_ranges (n + 2)

        let fastcgi_hide_header =
              fastcgi_hide_header.opt c.fastcgi_hide_header (n + 2)

        let fastcgi_ignore_client_abort =
              fastcgi_ignore_client_abort.opt
                c.fastcgi_ignore_client_abort
                (n + 2)

        let fastcgi_index = fastcgi_index.opt c.fastcgi_index (n + 2)

        let fastcgi_intercept_errors =
              fastcgi_intercept_errors.opt c.fastcgi_intercept_errors (n + 2)

        let fastcgi_keep_conn =
              fastcgi_keep_conn.opt c.fastcgi_keep_conn (n + 2)

        let fastcgi_limit_rate =
              fastcgi_limit_rate.opt c.fastcgi_limit_rate (n + 2)

        let fastcgi_next_upstream_tries =
              fastcgi_next_upstream_tries.opt
                c.fastcgi_next_upstream_tries
                (n + 2)

        let fastcgi_pass_header =
              fastcgi_pass_header.opt c.fastcgi_pass_header (n + 2)

        let fastcgi_pass_request_body =
              fastcgi_pass_request_body.opt c.fastcgi_pass_request_body (n + 2)

        let fastcgi_request_buffering =
              fastcgi_request_buffering.opt c.fastcgi_request_buffering (n + 2)

        let fastcgi_socket_keepalive =
              fastcgi_socket_keepalive.opt c.fastcgi_socket_keepalive (n + 2)

        let fastcgi_params =
              optList
                fastcgi_param.Type
                (fastcgi_param.make (n + 2))
                c.fastcgi_param

        let index = Optional/map index.Type Text (index.make (n + 2)) c.index

        let limit_rate_after = limit_rate_after.opt c.limit_rate_after (n + 2)

        let location = optList location.Type (location.make (n + 2)) c.location

        let log_not_found =
              Optional/map
                log_not_found.Type
                Text
                (log_not_found.make (n + 2))
                c.log_not_found

        let postpone_output = postpone_output.opt c.postpone_output (n + 2)

        let request_pool_size =
              request_pool_size.opt c.request_pool_size (n + 2)

        let root = Optional/map root.Type Text (root.make (n + 2)) c.root

        let satisfy =
              Optional/map satisfy.Type Text (satisfy.make (n + 2)) c.satisfy

        let send_lowat = send_lowat.opt c.send_lowat (n + 2)

        let sendfile_max_chunk =
              sendfile_max_chunk.opt c.sendfile_max_chunk (n + 2)

        let server_name =
              if    Natural/isZero (List/length Text c.server_name)
              then  None Text
              else  Some (server_name.make (n + 2) c.server_name)

        let subrequest_output_buffer_size =
              subrequest_output_buffer_size.opt
                c.subrequest_output_buffer_size
                (n + 2)

        let tcp_nodelay = tcp_nodelay.opt c.tcp_nodelay (n + 2)

        let try_files =
              Optional/map
                try_files.Type
                Text
                (try_files.make (n + 2))
                c.try_files

        let types_hash_bucket_size =
              types_hash_bucket_size.opt c.types_hash_bucket_size (n + 2)

        let types_hash_max_size =
              types_hash_max_size.opt c.types_hash_max_size (n + 2)

        let directives =
              List/unpackOptionals
                Text
                [ access_log
                , access_rules
                , add_header
                , add_trailer
                , auth_basic
                , auth_basic_user_file
                , autoindex
                , autoindex_exact_size
                , autoindex_format
                , autoindex_localtime
                , client_body_buffer_size
                , client_header_buffer_size
                , client_max_body_size
                , connection_pool_size
                , default_type
                , directio
                , directio_alignment
                , expires
                , fastcgi_buffering
                , fastcgi_cache_background_update
                , fastcgi_cache_key
                , fastcgi_cache_lock
                , fastcgi_cache_max_range_offset
                , fastcgi_cache_min_uses
                , fastcgi_cache_revalidate
                , fastcgi_catch_stderr
                , fastcgi_force_ranges
                , fastcgi_hide_header
                , fastcgi_ignore_client_abort
                , fastcgi_index
                , fastcgi_intercept_errors
                , fastcgi_keep_conn
                , fastcgi_limit_rate
                , fastcgi_params
                , fastcgi_next_upstream_tries
                , fastcgi_pass_header
                , fastcgi_pass_request_body
                , fastcgi_request_buffering
                , fastcgi_socket_keepalive
                , fastcgi_params
                , index
                , limit_rate_after
                , location
                , log_not_found
                , postpone_output
                , request_pool_size
                , root
                , satisfy
                , send_lowat
                , sendfile_max_chunk
                , server_name
                , subrequest_output_buffer_size
                , tcp_nodelay
                , try_files
                , types_hash_bucket_size
                , types_hash_max_size
                ]

        in  Text/concatSep
              "\n"
              [ indent n "server {"
              , Text/concatSep "\n" directives
              , indent n "}"
              ]

in  { Type = type, default, make }
