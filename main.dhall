let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/concat = https://prelude.dhall-lang.org/List/concat.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let Optional/map = https://prelude.dhall-lang.org/Optional/map.dhall

let user = ./directives/ngx_core_module/user/schema.dhall

let worker_processes =
      ./directives/ngx_core_module/worker_processes/schema.dhall

let worker_cpu_affinity =
      ./directives/ngx_core_module/worker_cpu_affinity/schema.dhall

let events = ./directives/ngx_core_module/events/schema.dhall

let http = ./directives/ngx_http_core_module/http/schema.dhall

let pcre_jit = ./directives/ngx_core_module/pcre_jit/schema.dhall

let pid = ./directives/ngx_core_module/pid/schema.dhall

let error_log = ./directives/ngx_core_module/error_log/schema.dhall

let default =
      { error_log = None ./directives/ngx_core_module/error_log/type.dhall
      , http = None ./directives/ngx_http_core_module/http/type.dhall
      , pcre_jit = None ./directives/ngx_core_module/pcre_jit/type.dhall
      , pid = None ./directives/ngx_core_module/pid/type.dhall
      , user = None ./directives/ngx_core_module/user/type.dhall
      , worker_cpu_affinity =
          None ./directives/ngx_core_module/worker_cpu_affinity/type.dhall
      , worker_processes =
          None ./directives/ngx_core_module/worker_processes/type.dhall
      }

let type =
      { error_log : Optional ./directives/ngx_core_module/error_log/type.dhall
      , events : ./directives/ngx_core_module/events/type.dhall
      , http : Optional ./directives/ngx_http_core_module/http/type.dhall
      , pcre_jit : Optional ./directives/ngx_core_module/pcre_jit/type.dhall
      , pid : Optional ./directives/ngx_core_module/pid/type.dhall
      , user : Optional ./directives/ngx_core_module/user/type.dhall
      , worker_cpu_affinity :
          Optional ./directives/ngx_core_module/worker_cpu_affinity/type.dhall
      , worker_processes :
          Optional ./directives/ngx_core_module/worker_processes/type.dhall
      }

let make =
      λ(n : Natural) →
      λ(c : type) →
        let user = Optional/map user.Type Text (user.make n) c.user

        let worker_processes =
              Optional/map
                worker_processes.Type
                Text
                (worker_processes.make n)
                c.worker_processes

        let worker_cpu_affinity =
              Optional/map
                worker_cpu_affinity.Type
                Text
                (worker_cpu_affinity.make n)
                c.worker_cpu_affinity

        let events = Some (events.make n c.events)

        let http = Optional/map http.Type Text (http.make n) c.http

        let pcre_jit =
              Optional/map pcre_jit.Type Text (pcre_jit.make n) c.pcre_jit

        let pid = Optional/map pid.Type Text (pid.make n) c.pid

        let error_log =
              Optional/map error_log.Type Text (error_log.make n) c.error_log

        let directives =
              List/concat
                (Optional Text)
                [ [ error_log
                  , events
                  , http
                  , pcre_jit
                  , pid
                  , user
                  , worker_cpu_affinity
                  , worker_processes
                  ]
                ]

        in  Text/concatSep "\n" (List/unpackOptionals Text directives) ++ "\n"

in  { Type = type, default, make }
