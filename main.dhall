let Prelude = ./Prelude.dhall

let Text/concatSep = Prelude.Text.concatSep

let List/unpackOptionals = Prelude.List.unpackOptionals

let directives = ./utils/directives.dhall

let debug_points = ./directives/ngx_core_module/debug_points/directive.dhall

let env = ./directives/ngx_core_module/env/directive.dhall

let error_log = ./directives/ngx_core_module/error_log/directive.dhall

let events = ./directives/ngx_core_module/events/directive.dhall

let http = ./directives/ngx_http_core_module/http/directive.dhall

let load_module = ./directives/ngx_core_module/load_module/directive.dhall

let lock_file = ./directives/ngx_core_module/lock_file/directive.dhall

let master_process = ./directives/ngx_core_module/master_process/directive.dhall

let pcre_jit = ./directives/ngx_core_module/pcre_jit/directive.dhall

let pid = ./directives/ngx_core_module/pid/directive.dhall

let ssl_engine = ./directives/ngx_core_module/ssl_engine/directive.dhall

let timer_resolution =
      ./directives/ngx_core_module/timer_resolution/directive.dhall

let user = ./directives/ngx_core_module/user/directive.dhall

let worker_aio_requests =
      ./directives/ngx_core_module/worker_aio_requests/directive.dhall

let worker_cpu_affinity =
      ./directives/ngx_core_module/worker_cpu_affinity/directive.dhall

let worker_priority =
      ./directives/ngx_core_module/worker_priority/directive.dhall

let worker_processes =
      ./directives/ngx_core_module/worker_processes/directive.dhall

let worker_rlimit_core =
      ./directives/ngx_core_module/worker_rlimit_core/directive.dhall

let worker_rlimit_nofile =
      ./directives/ngx_core_module/worker_rlimit_nofile/directive.dhall

let worker_shutdown_timeout =
      ./directives/ngx_core_module/worker_shutdown_timeout/directive.dhall

let working_directory =
      ./directives/ngx_core_module/working_directory/directive.dhall

let default =
      { debug_points = None ./directives/ngx_core_module/debug_points/type.dhall
      , env = None ./directives/ngx_core_module/env/type.dhall
      , error_log = None ./directives/ngx_core_module/error_log/type.dhall
      , http = None ./directives/ngx_http_core_module/http/type.dhall
      , load_modules =
          [] : List ./directives/ngx_core_module/load_module/type.dhall
      , lock_file = None ./directives/ngx_core_module/lock_file/type.dhall
      , master_process =
          None ./directives/ngx_core_module/master_process/type.dhall
      , pcre_jit = None ./directives/ngx_core_module/pcre_jit/type.dhall
      , pid = None ./directives/ngx_core_module/pid/type.dhall
      , ssl_engine = None ./directives/ngx_core_module/ssl_engine/type.dhall
      , timer_resolution =
          None ./directives/ngx_core_module/timer_resolution/type.dhall
      , user = None ./directives/ngx_core_module/user/type.dhall
      , worker_aio_requests =
          None ./directives/ngx_core_module/worker_aio_requests/type.dhall
      , worker_cpu_affinity =
          None ./directives/ngx_core_module/worker_cpu_affinity/type.dhall
      , worker_priority =
          None ./directives/ngx_core_module/worker_priority/type.dhall
      , worker_processes =
          None ./directives/ngx_core_module/worker_processes/type.dhall
      , worker_rlimit_core =
          None ./directives/ngx_core_module/worker_rlimit_core/type.dhall
      , worker_rlimit_nofile =
          None ./directives/ngx_core_module/worker_rlimit_nofile/type.dhall
      , worker_shutdown_timeout =
          None ./directives/ngx_core_module/worker_shutdown_timeout/type.dhall
      , working_directory =
          None ./directives/ngx_core_module/working_directory/type.dhall
      }

let type =
      { debug_points :
          Optional ./directives/ngx_core_module/debug_points/type.dhall
      , env : Optional ./directives/ngx_core_module/env/type.dhall
      , error_log : Optional ./directives/ngx_core_module/error_log/type.dhall
      , events : ./directives/ngx_core_module/events/type.dhall
      , http : Optional ./directives/ngx_http_core_module/http/type.dhall
      , load_modules : List ./directives/ngx_core_module/load_module/type.dhall
      , lock_file : Optional ./directives/ngx_core_module/lock_file/type.dhall
      , master_process :
          Optional ./directives/ngx_core_module/master_process/type.dhall
      , pcre_jit : Optional ./directives/ngx_core_module/pcre_jit/type.dhall
      , pid : Optional ./directives/ngx_core_module/pid/type.dhall
      , ssl_engine : Optional ./directives/ngx_core_module/ssl_engine/type.dhall
      , timer_resolution :
          Optional ./directives/ngx_core_module/timer_resolution/type.dhall
      , user : Optional ./directives/ngx_core_module/user/type.dhall
      , worker_aio_requests :
          Optional ./directives/ngx_core_module/worker_aio_requests/type.dhall
      , worker_cpu_affinity :
          Optional ./directives/ngx_core_module/worker_cpu_affinity/type.dhall
      , worker_priority :
          Optional ./directives/ngx_core_module/worker_priority/type.dhall
      , worker_processes :
          Optional ./directives/ngx_core_module/worker_processes/type.dhall
      , worker_rlimit_core :
          Optional ./directives/ngx_core_module/worker_rlimit_core/type.dhall
      , worker_rlimit_nofile :
          Optional ./directives/ngx_core_module/worker_rlimit_nofile/type.dhall
      , worker_shutdown_timeout :
          Optional
            ./directives/ngx_core_module/worker_shutdown_timeout/type.dhall
      , working_directory :
          Optional ./directives/ngx_core_module/working_directory/type.dhall
      }

let make =
      λ(n : Natural) →
      λ(c : type) →
        let debug_points = debug_points.opt c.debug_points n

        let env = env.opt c.env n

        let error_log = error_log.opt c.error_log n

        let events = Some (events.make n c.events)

        let http = http.opt c.http n

        let load_modules = load_module.listOpt c.load_modules n

        let lock_file = lock_file.opt c.lock_file n

        let master_process = master_process.opt c.master_process n

        let pcre_jit = pcre_jit.opt c.pcre_jit n

        let pid = pid.opt c.pid n

        let ssl_engine = ssl_engine.opt c.ssl_engine n

        let timer_resolution = timer_resolution.opt c.timer_resolution n

        let user = user.opt c.user n

        let worker_aio_requests =
              worker_aio_requests.opt c.worker_aio_requests n

        let worker_cpu_affinity =
              worker_cpu_affinity.opt c.worker_cpu_affinity n

        let worker_priority = worker_priority.opt c.worker_priority n

        let worker_processes = worker_processes.opt c.worker_processes n

        let worker_rlimit_core = worker_rlimit_core.opt c.worker_rlimit_core n

        let worker_rlimit_nofile =
              worker_rlimit_nofile.opt c.worker_rlimit_nofile n

        let worker_shutdown_timeout =
              worker_shutdown_timeout.opt c.worker_shutdown_timeout n

        let working_directory = working_directory.opt c.working_directory n

        let directives =
              List/unpackOptionals
                Text
                [ load_modules
                , debug_points
                , env
                , error_log
                , events
                , http
                , lock_file
                , master_process
                , pcre_jit
                , pid
                , ssl_engine
                , timer_resolution
                , user
                , worker_aio_requests
                , worker_cpu_affinity
                , worker_priority
                , worker_processes
                , worker_rlimit_core
                , worker_rlimit_nofile
                , worker_shutdown_timeout
                , working_directory
                ]

        in  Text/concatSep "\n" directives ++ "\n"

in  directives.makeDirective type make ⫽ { default }
