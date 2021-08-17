let Prelude = ../../../Prelude.dhall

let List/unpackOptionals = Prelude.List.unpackOptionals

let Optional/map = Prelude.Optional.map

let Text/concatMapSep = Prelude.Text.concatMapSep

let Text/concatSep = Prelude.Text.concatSep

let Bool/onOff = ../../../utils/Bool/onOff.dhall

let d = ../../../utils/directives.dhall

let default = ./default.dhall

let indent = ../../../utils/indent.dhall

let Interval = ../../../types/Interval/type.dhall

let Interval/show = ../../../types/Interval/show.dhall

let Size = ../../../types/Size/type.dhall

let Size/show = ../../../types/Size/show.dhall

let type = ./type.dhall

let make =
      λ(n : Natural) →
      λ(value : type) →
        let path = value.path

        let levels =
              if    Natural/isZero (List/length Natural value.levels)
              then  None Text
              else  Some
                      (Text/concatMapSep ":" Natural Natural/show value.levels)

        let use_temp_path =
              Optional/map
                Bool
                Text
                (λ(v : Bool) → "use_temp_path=${Bool/onOff v}")
                value.use_temp_path

        let keys_zone =
              let name = value.keys_zone.name

              let size = Size/show value.keys_zone.size

              in  Some "keys_zone=${name}:${size}"

        let inactive =
              Optional/map
                Interval
                Text
                (λ(v : Interval) → "inactive=${Interval/show v}")
                value.inactive

        let max_size =
              Optional/map
                Size
                Text
                (λ(v : Size) → "max_size=${Size/show v}")
                value.max_size

        let min_free =
              Optional/map
                Size
                Text
                (λ(v : Size) → "min_free=${Size/show v}")
                value.min_free

        let manager_files =
              Optional/map
                Natural
                Text
                (λ(v : Natural) → "manager_files=${Natural/show v}")
                value.manager_files

        let manager_sleep =
              Optional/map
                Interval
                Text
                (λ(v : Interval) → "manager_sleep=${Interval/show v}")
                value.manager_sleep

        let manager_threshold =
              Optional/map
                Interval
                Text
                (λ(v : Interval) → "manager_threshold=${Interval/show v}")
                value.manager_threshold

        let loader_files =
              Optional/map
                Natural
                Text
                (λ(v : Natural) → "loader_files=${Natural/show v}")
                value.loader_files

        let loader_sleep =
              Optional/map
                Natural
                Text
                (λ(v : Natural) → "loader_sleep=${Natural/show v}")
                value.loader_sleep

        let loader_threshold =
              Optional/map
                Interval
                Text
                (λ(v : Interval) → "loader_threshold=${Interval/show v}")
                value.loader_threshold

        let purger =
              Optional/map
                Bool
                Text
                (λ(v : Bool) → "purger=${Bool/onOff v}")
                value.purger

        let purger_files =
              Optional/map
                Natural
                Text
                (λ(v : Natural) → "purger_files=${Natural/show v}")
                value.purger_files

        let purger_sleep =
              Optional/map
                Interval
                Text
                (λ(v : Interval) → "purger_sleep=${Interval/show v}")
                value.purger_sleep

        let purger_threshold =
              Optional/map
                Interval
                Text
                (λ(v : Interval) → "purger_threshold=${Interval/show v}")
                value.purger_threshold

        let optionals =
              [ levels
              , use_temp_path
              , keys_zone
              , inactive
              , max_size
              , min_free
              , manager_files
              , manager_sleep
              , manager_threshold
              , loader_files
              , loader_sleep
              , loader_threshold
              , purger
              , purger_files
              , purger_sleep
              , purger_threshold
              ]

        let params = Text/concatSep " " (List/unpackOptionals Text optionals)

        in  indent n "proxy_cache_path ${path} ${params};"

in  d.makeDirective type make ⫽ { default }
