let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/concat = https://prelude.dhall-lang.org/List/concat.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let user = ./directives/ngx_core_module/user/schema.dhall

let worker_processes =
      ./directives/ngx_core_module/worker_processes/schema.dhall

let worker_cpu_affinity =
      ./directives/ngx_core_module/worker_cpu_affinity/schema.dhall

let type =
      { error_log : Optional ./directives/ngx_core_module/error_log/type.dhall
      , events : Optional ./directives/ngx_core_module/events/type.dhall
      , http : Optional ./directives/ngx_http_core_module/http/type.dhall
      , pid : Optional ./directives/ngx_core_module/pid/type.dhall
      , user : Optional ./directives/ngx_core_module/user/type.dhall
      , worker_cpu_affinity :
          Optional ./directives/ngx_core_module/worker_cpu_affinity/type.dhall
      , worker_processes :
          Optional ./directives/ngx_core_module/worker_processes/type.dhall
      }

let events = ./directives/ngx_core_module/events/schema.dhall

let http = ./directives/ngx_http_core_module/http/schema.dhall

let pid = ./directives/ngx_core_module/pid/schema.dhall

let error_log = ./directives/ngx_core_module/error_log/schema.dhall

let default =
      { error_log = None ./directives/ngx_core_module/error_log/type.dhall
      , events = None ./directives/ngx_core_module/events/type.dhall
      , http = None ./directives/ngx_http_core_module/http/type.dhall
      , pid = None ./directives/ngx_core_module/pid/type.dhall
      , user = None ./directives/ngx_core_module/user/type.dhall
      , worker_cpu_affinity =
          None ./directives/ngx_core_module/worker_cpu_affinity/type.dhall
      , worker_processes =
          None ./directives/ngx_core_module/worker_processes/type.dhall
      }

let make =
      λ(n : Natural) →
      λ(c : type) →
        let user =
              merge
                { Some = λ(x : user.Type) → Some (user.make n x)
                , None = None Text
                }
                c.user

        let worker_processes =
              merge
                { Some =
                    λ(x : worker_processes.Type) →
                      Some (worker_processes.make n x)
                , None = None Text
                }
                c.worker_processes

        let worker_cpu_affinity =
              merge
                { Some =
                    λ(x : worker_cpu_affinity.Type) →
                      Some (worker_cpu_affinity.make n x)
                , None = None Text
                }
                c.worker_cpu_affinity

        let events =
              merge
                { Some = λ(x : events.Type) → Some (events.make n x)
                , None = None Text
                }
                c.events

        let http =
              merge
                { Some = λ(x : http.Type) → Some (http.make n x)
                , None = None Text
                }
                c.http

        let pid =
              merge
                { Some = λ(x : pid.Type) → Some (pid.make n x)
                , None = None Text
                }
                c.pid

        let error_log =
              merge
                { Some = λ(x : error_log.Type) → Some (error_log.make n x)
                , None = None Text
                }
                c.error_log

        let directives =
              List/concat
                (Optional Text)
                [ [ error_log, events, http, pid ]
                , [ user, worker_cpu_affinity, worker_processes ]
                ]

        in  Text/concatSep "\n" (List/unpackOptionals Text directives) ++ "\n"

in  { Type = type, default, make }
