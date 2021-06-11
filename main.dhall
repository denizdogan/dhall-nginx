let Text/concatSep = https://prelude.dhall-lang.org/Text/concatSep.dhall

let List/unpackOptionals =
      https://prelude.dhall-lang.org/List/unpackOptionals.dhall

let directives = ./utils/directives.dhall

let user = ./directives/ngx_core_module/user/schema.dhall

let worker_processes =
      ./directives/ngx_core_module/worker_processes/schema.dhall

let worker_cpu_affinity =
      ./directives/ngx_core_module/worker_cpu_affinity/schema.dhall

let events = ./directives/ngx_core_module/events/schema.dhall

let load_module = ./directives/ngx_core_module/load_module/schema.dhall

let http = ./directives/ngx_http_core_module/http/schema.dhall

let pcre_jit = ./directives/ngx_core_module/pcre_jit/schema.dhall

let pid = ./directives/ngx_core_module/pid/schema.dhall

let error_log = ./directives/ngx_core_module/error_log/schema.dhall

let worker_rlimit_core =
      ./directives/ngx_core_module/worker_rlimit_core/schema.dhall

let worker_rlimit_nofile =
      ./directives/ngx_core_module/worker_rlimit_nofile/schema.dhall

let default =
      { error_log = None ./directives/ngx_core_module/error_log/type.dhall
      , http = None ./directives/ngx_http_core_module/http/type.dhall
      , load_modules =
          [] : List ./directives/ngx_core_module/load_module/type.dhall
      , pcre_jit = None ./directives/ngx_core_module/pcre_jit/type.dhall
      , pid = None ./directives/ngx_core_module/pid/type.dhall
      , user = None ./directives/ngx_core_module/user/type.dhall
      , worker_cpu_affinity =
          None ./directives/ngx_core_module/worker_cpu_affinity/type.dhall
      , worker_processes =
          None ./directives/ngx_core_module/worker_processes/type.dhall
      , worker_rlimit_core =
          None ./directives/ngx_core_module/worker_rlimit_core/type.dhall
      , worker_rlimit_nofile =
          None ./directives/ngx_core_module/worker_rlimit_nofile/type.dhall
      }

let type =
      { error_log : Optional ./directives/ngx_core_module/error_log/type.dhall
      , events : ./directives/ngx_core_module/events/type.dhall
      , http : Optional ./directives/ngx_http_core_module/http/type.dhall
      , load_modules : List ./directives/ngx_core_module/load_module/type.dhall
      , pcre_jit : Optional ./directives/ngx_core_module/pcre_jit/type.dhall
      , pid : Optional ./directives/ngx_core_module/pid/type.dhall
      , user : Optional ./directives/ngx_core_module/user/type.dhall
      , worker_cpu_affinity :
          Optional ./directives/ngx_core_module/worker_cpu_affinity/type.dhall
      , worker_processes :
          Optional ./directives/ngx_core_module/worker_processes/type.dhall
      , worker_rlimit_core :
          Optional ./directives/ngx_core_module/worker_rlimit_core/type.dhall
      , worker_rlimit_nofile :
          Optional ./directives/ngx_core_module/worker_rlimit_nofile/type.dhall
      }

let make =
      λ(n : Natural) →
      λ(c : type) →
        let user = user.opt c.user n

        let worker_processes = worker_processes.opt c.worker_processes n

        let worker_cpu_affinity =
              worker_cpu_affinity.opt c.worker_cpu_affinity n

        let events = Some (events.make n c.events)

        let http = http.opt c.http n

        let load_modules = load_module.listOpt c.load_modules n

        let pcre_jit = pcre_jit.opt c.pcre_jit n

        let pid = pid.opt c.pid n

        let error_log = error_log.opt c.error_log n

        let worker_rlimit_core = worker_rlimit_core.opt c.worker_rlimit_core n

        let worker_rlimit_nofile =
              worker_rlimit_nofile.opt c.worker_rlimit_nofile n

        let directives =
              List/unpackOptionals
                Text
                [ load_modules
                , error_log
                , events
                , http
                , pcre_jit
                , pid
                , user
                , worker_cpu_affinity
                , worker_processes
                , worker_rlimit_core
                , worker_rlimit_nofile
                ]

        in  Text/concatSep "\n" directives ++ "\n"

in  directives.makeDirective type make ⫽ { default }
